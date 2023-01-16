# MRI-PET registration : moving image : PET, target image : MRI
# MRI : 3D MPRAGE
# PET : FDG-PET
#!/bin/bash
### User Defined Variables ###
TargetImgName="/media/sf_Common/KOGOsample/PD_T1_FDG_CIT/PD_3DMRI_Example.nii" # Your Target Image
BETImgName="/media/sf_Common/KOGOsample/PD_T1_FDG_CIT/bPD_3DMRI_Example.nii" # Your Brain Extracted Target Image
MovingImgName="/media/sf_Common/KOGOsample/PD_T1_FDG_CIT/PD_FDG_Example.nii" # Your Moving Image
OutputMatrix="/media/sf_Common/KOGOsample/PD_T1_FDG_CIT/PD_FDG_Example.mat" # Affine Transformation Matrix
OutputImgName="/media/sf_Common/KOGOsample/PD_T1_FDG_CIT/rPD_FDG_Example.nii" # Affine Transformed Output Image
##############################################################################
SECOND=0

bet $TargetImgName $BETImgName
flirt -in $MovingImgName -ref $BETImgName -omat $OutputMatrix -out $OutputImgName
t=$SECONDS
printf 'Time taken: %d days, %d minutes\n' "$(( t/86400 ))" "$(( t/60 - 1440*(t/86400) ))"
