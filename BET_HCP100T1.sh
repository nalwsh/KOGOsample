#!/bin/bash

DataDir="/media/sf_Common/KOGOsample/HCP100_T1/"
OutDir="/media/sf_Common/KOGOsample/HCP100_bet/"
if [ -d $OutDir ] 
then
    echo "Directory" $OutDir" exists." 
else
    mkdir -p $OutDir
fi
for T1name in `ls $DataDir`; do
    SECOND=0
    InputImgName=$DataDir$T1name
    BetImaName=$OutDir'b'$T1name
    bet $InputImgName $BetImaName
    printf "$T1name ended\n"
done