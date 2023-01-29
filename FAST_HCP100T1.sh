#/bin/bash
# Segmentation of 3D image into different tissue type with FAST (FMRIB's Automated Segmentation Tool)

RawDir="/media/sf_Common/KOGOsample/HCP100/"
DataDir="/media/sf_Common/KOGOsample/HCP100_bet/"
OutDirBase="/media/sf_Common/KOGOsample/HCP100_fast/"
MRtype=1 # Type of MRI. 1 for T1, 2 for T2, 3 for PD
Nseg=3 # number of tissue-type classes. 3 for GM, WM, and CSF
if [ -d $OutDirBase ] 
then
    echo "Directory" $OutDirBase" exists." 
else
    mkdir -p $OutDirBase
fi

Dlist=(`ls $RawDir`)
Dlistlen=${#Dlist[*]}
Dlistlen=1

for ((i=0;i<=$Dlistlen;i++)); do
    Did=${Dlist[i]}
    OutDir=$OutDirBase$Did"/"
    if [ -d $OutDir ] 
        then
        echo "Directory" $OutDir" exists." 
    else
        mkdir -p $OutDir
    fi
    SECOND=0
    InputImgName=$DataDir"bb"$Did"_3T_T1w_MPR1.nii"
    OutputName=$OutDir$Did"_fast_"
    fast --channels=1 --type=1 --out=$OutputName --class=3 --segments $InputImgName
    printf "$Did ended\n"
done
