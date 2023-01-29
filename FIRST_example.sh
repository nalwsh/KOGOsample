#/bin/bash
# Segmentation ans surface modeling of subcortical structure with FSL-FIRST
### User Defined Variables ###
DataDir="/media/sf_Common/KOGOsample/HCP100_T1_example/"
Did="100307"
###############################################
InputImgName=$DataDir"b"$Did"_3T_T1w_MPR1.nii"
OutputName=$DataDir$Did"_first_"
run_first_all -i $InputImgName -o $OutputName
