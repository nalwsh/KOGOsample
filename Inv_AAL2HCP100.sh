#!/bin/bash
## extract Subject ID

AAL2directory="/home/pmri/Ana/Utils/AAL_ROI/"
search_dir='/media/sf_Common/KOGOsample/HCP100/'
OutDirBase="/media/sf_Common/KOGOsample/HCP100_AAL/"
T1DirBase="/media/sf_Common/KOGOsample/HCP100_T1/"
DeformCoeffientDirBase="/media/sf_Common/KOGOsample/HCP100_fnirt/"

for Sid in `ls $search_dir`; do
    OutDir=$OutDirBase$Sid"/"
    if [ -d $OutDir ] 
        then
        echo "Directory" $OutDir" exists." 
    else
        mkdir -p $OutDir
    fi
    AAL2T1directory=$OutDir"AAL/"
    if [ -d $AAL2T1directory ] 
        then
        echo "Directory" $AAL2T1directory" exists." 
    else
        mkdir -p $AAL2T1directory
    fi
    Tindex=0;
    T1name=$T1DirBase"b"$Sid"_3T_T1w_MPR1.nii"
    DeformCoefficientName=$DeformCoeffientDirBase"bb"$Sid"_3T_T1w_MPR1.nii_deform_coeff.nii"
    WarpMNI_into_StructualMRI=$OutDir$Sid"_WarpMNI2T1.nii"
    invwarp --ref=$T1name --warp=$DeformCoefficientName --out=$WarpMNI_into_StructualMRI
    for i in {1..20}; do # AAL2 atlas files
        AAL2name=$AAL2directory"AAL_"$i".nii"
        AAL2T1name=$AAL2T1directory"AAL_"$i".nii"
        applywarp --ref=$T1name --in=$AAL2name --warp=$WarpMNI_into_StructualMRI --out=$AAL2T1name --interp=nn
    done
    t=$SECONDS
    printf 'Time taken: %d days, %d minutes\n' "$(( t/86400 ))" "$(( t/60 - 1440*(t/86400) ))"
done