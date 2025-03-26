#!/bin/bash

export PATH=$PATH:/user/lpp/java/J8.0_64/bin
export JAVA_HOME=/user/lpp/java/J8.0_64
export PATH=$PATH:/user/lpp/zowe/cli/node/bin

java -version

ZOWE_USERNAME="Z63454"

cd cobolcheck
echo "Changed to $(pwd)"
ls -al

chmod +x cobolcheck
echo "made cobolcheck exe."

cd scripts
chmod +x linux_gnucobol_run_tests
echo "made linux_gnucobol exe."
cd ..

run_cobolcheck() {
program = $1
echo "Running cobolcheck for $program"

./cobolcheck -p $program
echo "completed for $program"

if [-f "CC##99.CBL"]; then
    if cp CC##99.CBL "//'{$ZOWE_USERNAME}.CBL($program)'"; then
        echo "copied"
    else
        echo "failed to copy"
    fi
else
    echo "CC##99 not found for $program"
fi

#copy the jcl
if [-f "${program).JCL"]; then
if cp ${program}.JCL "//'{$ZOWE_USERNAME}.JCL($program)'"; then
        echo "copied"
    else
        echo "failed to copy"
    fi
else
    echo "$(program) jcl not found"
fi
}

for program in NUMBERS EMPPAY DEPTPAY ; do
    run_cobolcheck $program
done

echo "mainframe ops complete"
