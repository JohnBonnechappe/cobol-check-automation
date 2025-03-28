#!/bin/bash

#zowe_operations.sh

LOWERCASE_USERNAME=$(echo "ZOWE_USERNAME" | tr '[:upper:]' '[:lower:]')

if !zowe zos-files list uss-files "/z/$LOWERCASE_USERNAME/cobolcheck" &>/dev/null; then
    echo "directory does not exist. creating it..."
    zowe zos-files create uss-directory /z/$LOWERCASE_USERNAME/cobolcheck
else
    echo "directory already exists..."
fi

zowe zos-files upload dir-to-uss "./cobol-check" "/z/$LOWERCASE_USERNAME/cobolcheck" --recursive
    --binary-files "cobol-check-0.2.16.jar"

echo "Verifying upload"
zowe zos-files list uss-files "/z/$LOWERCASE_USERNAME/cobolcheck"
echo "Done"
