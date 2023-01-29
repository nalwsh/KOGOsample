#!/bin/bash
### User Defined Variables ###
DataDir=/media/sf_Common/KOGOsample/HCP100_T1_example/
Did="100307"
InputImgName=$DataDir"b"$Did"_3T_T1w_MPR1.nii"
BettedImgName=$DataDir"bb"$Did"_3T_T1w_MPR1.nii"
OnlyBrainRefImgName="/home/pmri/fsl/data/standard/MNI152_T1_2mm_brain.nii.gz"
AffineName=$DataDir"bb"$Did"_3T_T1w_MPR1.nii_affine.mat"
DeformCoefficientName=$DataDir"bb"$Did"_3T_T1w_MPR1.nii_deform_coeff.nii"
OutputImgName=$DataDir$"nbb"$Did"_3T_T1w_MPR1.nii"
#####################################################
bet $InputImgName $BettedImgName
flirt -ref $OnlyBrainRefImgName -in $BettedImgName -omat $AffineName
fnirt --ref=$OnlyBrainRefImgName --in=$BettedImgName --aff=$AffineName --config=T1_2_MNI152_2mm --cout=$DeformCoefficientName
applywarp --ref=$OnlyBrainRefImgName --in=$InputImgName --warp=$DeformCoefficientName --out=$OutputImgName
