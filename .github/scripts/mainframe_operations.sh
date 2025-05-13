#!/bin/bash

export PATH=$PATH:/user/lpp/java/J8.0_64/bin
export JAVA_HOME=/user/lpp/java/J8.0_64
export PATH=$PATH:/user/lpp/zowe/cli/node/bin

java -version

ZOWE_USERNAME=$ZOWE_USERNAME
LOWERCASE_USERNAME =$LOWERCASE_USERNAME

cd cobol-check
echo "Changed to $(pwd)"
ls -al

chmod +x cobolcheck
echo "made cobolcheck exe."

cd scripts
chmod +x linux_gnucobol_run_tests
echo "made linux_gnucobol exe."

run_cobolcheck() {
  echo "chk1"
  cd /home/runner/work/cobol-check-automation/cobol-check-automation/cobol-check
  ls -la
  echo "chk2"
  cd $GITHUB_WORKSPACE/cobol-check
  ls -la
  echo "chk go"
  program=$1
  echo "****************************************"
  echo "******** Running cobolcheck for $program"

  ./cobolcheck -p $program
  echo "******** cobolcheck completed for $program"

#  echo "*******test tfr*********"
#  echo "junk" > jnk.dat
#  zowe zos-files upload file-to-data-set "jnk.dat" "$LOWERCASE_USERNAME.CBL(NUMBER2)" --u $ZOWE_USERNAME --pw $ZOWE_PASSWORD
#  echo "*******done test tfr******"

  if [ -f "CC##99.CBL" ]; then
      zowe_sts=false
      zowe zos-files upload file-to-data-set "CC##99.CBL" "$LOWERCASE_USERNAME.CBL($program)" --u $ZOWE_USERNAME --pw $ZOWE_PASSWORD && zowe_sts=true
      echo "Zowe status after copy=$zowe_sts"
      if $zowe_sts; then
          echo "copied $program"
      else
          echo "failed to copy $program"
      fi
  else
      echo "CC##99 not found for $program"
  fi
  echo "*********************************************"

#copy the jcl
  echo "Copying the JCL"
  echo $(pwd)
  echo "proceeding but check first"
  ls -la
  cd $GITHUB_WORKSPACE/cobol-check/src/main/cobol
  if [ -f "${program}.JCL" ]; then
      zowe_sts=false
      zowe zos-files upload file-to-data-set "$program.JCL" "$LOWERCASE_USERNAME.JCL($program)" --u $ZOWE_USERNAME --pw $ZOWE_PASSWORD && zowe_sts=true
      if $zowe_sts; then
          echo "copied JCL"
      else
          echo "failed to copy JCL"
      fi
  else
      echo "${program}.JCL not found"
  fi
}

for program in NUMBERS EMPPAY DEPTPAY ; do
    run_cobolcheck $program
done

echo "******** mainframe ops complete"
