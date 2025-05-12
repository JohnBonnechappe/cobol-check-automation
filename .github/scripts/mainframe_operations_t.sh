#!/bin/bash

java -version

ZOWE_USERNAME = $ZOWE_USERNAME
ZOWE_PASSWORD = $ZOWE_PASSWORD

echo "in mf_t"
echo "for un=$ZOWE_USERNAME"
echo "for lower_un=$LOWERCASE_USERNAME"
echo "for pw=$ZOWE_PASSWORD"

cd cobol-check
echo "Changed to $(pwd)"
ls -al

echo "test of numbers" >> CC0099.CBL

if cp CC0099.CBL "//'{$LOWERCASE_USERNAME}.CBL(NUMBERZ)'"; then
    echo "copied program"
else
    echo "failed to copy program"
fi
