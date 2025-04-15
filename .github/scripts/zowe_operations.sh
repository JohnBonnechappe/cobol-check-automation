#!/bin/bash

#zowe_operations.sh

LOWERCASE_USERNAME=$(echo "ZOWE_USERNAME" | tr '[:upper:]' '[:lower:]')

if !zowe zos-files list uss-files "/z/$LOWERCASE_USERNAME/cobolcheck" &>/dev/null; then
    echo "cobolcheck directory does not exist. creating it..."
    zowe zos-files create uss-directory /z/$LOWERCASE_USERNAME/cobolcheck--u $ZOWE_USERNAME --pw $ZOWE_PASSWORD

    echo "uploading cobolcheck"

    zowe zos-files upload dir-to-uss "./cobol-check" "/z/$LOWERCASE_USERNAME/cobolcheck" --recursive --u $ZOWE_USERNAME --pw $ZOWE_PASSWORD
    --binary-files "cobol-check-0.2.16.jar"  
else
    echo "cobolcheck directory already exists..."
fi

echo "Verifying upload"
zowe zos-files list uss-files "/z/$LOWERCASE_USERNAME/cobolcheck" --u $ZOWE_USERNAME --pw $ZOWE_PASSWORD
echo "Done"
