
#!/bin/bash

# Use sed to quote filepaths which may contain spaces.
BROKEN_POD_FILES=$(grep -l -r 'NO_SIGNING/' --include '*.pbxproj' . | sed -e 's/^/"/g' -e 's/$/"/g')

if [[ ! -z "$BROKEN_POD_FILES" ]];
then
 echo 'Fixing CocoaPods projects with "NO_SIGNING/" provisioning profiles. See https://github.com/CocoaPods/CocoaPods/issues/7038'
 echo $BROKEN_POD_FILES | xargs perl -pi -e 's/PROVISIONING_PROFILE_SPECIFIER = NO_SIGNING\//CODE_SIGNING_ALLOWED = NO/g'
fi