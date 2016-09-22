#!/bin/bash
# Requires sndcomp_export to be running.
# Uses export.sh to export basic data and map.
(./export.sh data)
# Basic settings to operate on:
expDate=$(date -I)
expDir="./src/sndComp_${expDate}_export"
sndFileDir="./exportSoundFiles"
# Copy Malakula data to exportSoundFiles:
cp $expDir/data/data_study_Malakula $sndFileDir/data.json
node $sndFileDir/soundDirectories.js ./data.json &> $sndFileDir/malakula.sh
rm $sndFileDir/data.json
# Use resulting malakula.sh:
chmod u+x $sndFileDir/malakula.sh
mv $sndFileDir/malakula.sh $expDir
(cd $expDir; sh ./malakula.sh)
rm $expDir/malakula.sh
# Create .zip of export data:
(cd ./src; zip -r "../sndComp_${expDate}_export_malakula.zip" "./sndComp_${expDate}_export/")
