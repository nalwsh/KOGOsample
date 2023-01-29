#/bin/bash
# Segmentation of 3D image into different tissue type with FAST (FMRIB's Automated Segmentation Tool)

### User Defined Variables ###
DataDir="/media/sf_Common/KOGOsample/HCP100_T1_example/"
Did="100307"
MRtype=1 # Type of MRI. 1 for T1, 2 for T2, 3 for PD
Nseg=3 # number of tissue-type classes. 3 for GM, WM, and CSF
############################################################
InputImgName=$DataDir"bb"$Did"_3T_T1w_MPR1.nii"
OutputName=$DataDir$Did"_fast_"
fast --channels=1 --type=$MRtype --out=$OutputName --class=$Nseg --segments $InputImgName


