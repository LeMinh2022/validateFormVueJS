#!/bin/bash

sshString="$1"
projectDir="$2"
releasesDir="${projectDir}/releases"
echo "$releasesDir"
newReleaseDir="${releasesDir}/$(date +%Y_%m_%d_%H_%M_%S)"
echo "$newReleaseDir"

ssh $sshString << ENDSSH
    mkdir $newReleaseDir
    echo "$newReleaseDir has been created!"
ENDSSH

echo "rsync dist/* to ${newReleaseDir} folder"
rsync -raqzv dist/ "${sshString}:${newReleaseDir}"

ssh $sshString << ENDSSH
    echo "Linking current release from ${newReleaseDir} to ${projectDir}/current"
    ln -nfs $newReleaseDir $projectDir/current

    echo "Remove old release sub folder (only keep 5 newest folders)"
    purging=$(ls -dt $releasesDir/* | tail -n +6)
    if [ "$purging" != "" ]
    then
        echo Purging old releases: $purging
        rm -rf $purging
    else
        echo 'No releases found for purging at this time'
    fi
ENDSSH
