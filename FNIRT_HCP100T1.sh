#!/bin/bash

RawDir="/media/sf_Common/KOGOsample/HCP100/"
RefImgName="/usr/local/fsl/data/standard/MNI152_T1_2mm.nii.gz" # Reference MRI (MNI152_T1_1mm.nii.gz)
OnlyBrainRefImgName="/usr/local/fsl/data/standard/MNI152_T1_2mm_brain.nii.gz"
DataDir="/media/sf_Common/KOGOsample/HCP100_bet/"
AffineDir="/media/sf_Common/KOGOsample/HCP100_flirt/"
OutDir="/media/sf_Common/KOGOsample/HCP100_fnirt/"
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
    SECOND=0
    InputImgName=$DataDir"bb"$Did"_3T_T1w_MPR1.nii"
    AffineName=$AffineDir"bb"$Did"_3T_T1w_MPR1.nii_affine.mat"
    DeformCoefficientName=$OutDir"bb"$Did"_3T_T1w_MPR1.nii_deform_coeff.nii"
    OutputImgName=$OutDir$"nbb"$Did"_3T_T1w_MPR1.nii"
    fnirt --ref=$RefImgName --in=$InputImgName --aff=$AffineName \
    --config=T1_2_MNI152_2mm --cout=$DeformCoefficientName
    applywarp --ref=$RefImgName --in=$InputImgName --warp=$DeformCoefficientName --out=$OutputImgName
    printf "$Did ended\n"
done