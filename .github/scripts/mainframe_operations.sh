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

cd ..

run_cobolcheck() {
  program=$1
  echo "****************************************"
  echo "******** Running cobolcheck for $program"

  ./cobolcheck -p $program
  echo "******** cobolcheck completed for $program"

  echo "*******test tfr"
  echo "junk" > jnk.dat
  zowe zos-files upload file-to-data-set "jnk.dat" "$LOWERCASE_USERNAME.CBL(NUMBER2)" --u $ZOWE_USERNAME --pw $ZOWE_PASSWORD
  echo "*******done test tfr******"

  if [ -f "CC##99.CBL" ]; then
      zowe zos-files upload file-to-data-set "CC##99.CBL" "$LOWERCASE_USERNAME.CBL(NUMBERZ)" --u $ZOWE_USERNAME --pw $ZOWE_PASSWORD
#      if cp CC##99.CBL "//'{$LOWERCASE_USERNAME}.CBL($program)'"; then
#          echo "copied $program"
#      else
#          echo "failed to copy $program"
#      fi
  else
      echo "CC##99 not found for $program"
  fi

#copy the jcl
  if [ -f "${program}.JCL" ]; then
      if cp ${program}.JCL "//'{$LOWERCASE_USERNAME}.JCL($program)'"; then
          echo "copied"
      else
          echo "failed to copy"
      fi
  else
      echo "${program}.jcl not found"
  fi
}

for program in NUMBERS EMPPAY DEPTPAY ; do
    run_cobolcheck $program
done

echo "******** mainframe ops complete"
