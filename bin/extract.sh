#!/bin/bash

topic="notification-center.event.send.external"
dirPath="/home/anton/dev/em/data/queue"
destDirPath="/home/anton/dev/em/data/queue/external"
files=( $(grep $topic -rwn $dirPath --include=\*.json | cut -d: -f1) )

for jsonFile in "${files[@]}"
do
        jsonFile="${jsonFile/\.\//}"
        file="${jsonFile/-headers+properties.json/}"
        destJsonFile="$destDirPath/$jsonFile"
        destFile="$destDirPath/$file"
        if [ -f "./$file" ]; then
                mv $file $destFile
                echo "moved - $destFile"
        fi
        if [ -f "./$jsonFile" ]; then
                mv $jsonFile $destJsonFile
                echo "moved - $destJsonFile"
        fi
done