#!/bin/bash

#zowe_operations.sh

#LOWERCASE_USERNAME=$(echo "ZOWE_USERNAME" | tr '[:upper:]' '[:lower:]')

cobolcheck_exists = false
zowe zos-files list uss-files "/z/$LOWERCASE_USERNAME/cobolcheck" --u $ZOWE_USERNAME --pw $ZOWE_PASSWORD && cobolcheck_exists=true

if cobolcheck_exists != true; then
    echo "cobolcheck directory does not exist. creating it..."
    zowe zos-files create uss-directory /z/$LOWERCASE_USERNAME/cobolcheck --u $ZOWE_USERNAME --pw $ZOWE_PASSWORD

    echo "uploading cobolcheck"

    zowe zos-files upload dir-to-uss "./cobol-check" "/z/$LOWERCASE_USERNAME/cobolcheck" --recursive --u $ZOWE_USERNAME --pw $ZOWE_PASSWORD \
    --binary-files "cobol-check-0.2.16.jar"  
else
    echo "cobolcheck directory already exists..."
fi

echo "Verifying upload"
zowe zos-files list uss-files "/z/$LOWERCASE_USERNAME/cobolcheck" --u $ZOWE_USERNAME --pw $ZOWE_PASSWORD
echo "Done"
