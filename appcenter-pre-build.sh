#!/usr/bin/env bash

from="PROVISIONING_PROFILE = .*"
to="PROVISIONING_PROFILE = \"\""

cd ./New.xcodeproj
cp -a ./project.pbxproj ./project.pbxproj_backup
rm ./project.pbxproj
cat ./project.pbxproj_backup | sed -e "s/$from/$to/g" >> ./project.pbxproj