#!/bin/bash
RawDir="/media/sf_Common/KOGOsample/HCP100/"
RefImgName="/usr/local/fsl/data/standard/MNI152_T1_2mm.nii.gz" # Reference MRI (MNI152_T1_1mm.nii.gz)
OnlyBrainRefImgName="/usr/local/fsl/data/standard/MNI152_T1_2mm_brain.nii.gz"
DataDir="/media/sf_Common/KOGOsample/HCP100_bet/"
OutDir="/media/sf_Common/KOGOsample/HCP100_flirt/"
if [ -d $OutDir ] 
then
    echo "Directory" $OutDir" exists." 
else
    mkdir -p $OutDir
fi
Dlist=(`ls $RawDir`)
Dlistlen=${#Dlist[*]}

for ((i=73;i<=$Dlistlen;i++)); do
    Did=${Dlist[i]}
    InputImgName=$DataDir"bb"$Did"_3T_T1w_MPR1.nii"
    OutAffine=$OutDir"bb"$Did"_3T_T1w_MPR1.nii_affine.mat"
    flirt -ref $OnlyBrainRefImgName -in $InputImgName -omat $OutAffine
    printf "$Did ended\n"
done