#/bin/bash

ANTbin='/home/pmri/Utils/ANTs-2.1.0-Linux/bin/'
ANTscripts='/home/pmri/Utils/ANTs-2.1.0-Linux/Scripts/'
export PATH=$PATH:$ANTbin

search_dir="/media/sf_Common/KOGOsample/HCP100/"
OutDir="/media/sf_Common/KOGOsample/HCP100_T1/"
echo $search_dir
for pid in `ls $search_dir`; do
    SECOND=0
    InputImgName=$search_dir$pid'/unprocessed/3T/T1w_MPR1/'$pid'_3T_T1w_MPR1.nii.gz'
    echo $InputImgName
    OutputImgName=$OutDir'b'$pid'_3T_T1w_MPR1.nii'
    N4BiasFieldCorrection -i $InputImgName -o $OutputImgName
    t=$SECONDS
    printf 'Time taken: %d days, %d minutes\n' "$(( t/86400 ))" "$(( t/60 - 1440*(t/86400) ))"
done