#/bin/bash
# Segmentation ans surface modeling of subcortical structure with FSL-FIRST

RawDir="/media/sf_Common/KOGOsample/HCP100/"
DataDir="/media/sf_Common/KOGOsample/HCP100_T1/"
OutDirBase="/media/sf_Common/KOGOsample/HCP100_first/"
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
    InputImgName=$DataDir"b"$Did"_3T_T1w_MPR1.nii"
    OutputName=$OutDir$Did"_first_"
    run_first_all -i $InputImgName -o $OutputName
    printf "$Did ended\n"
done


