# -*- coding: utf-8 -*-
"""
Created on Thu Dec  8 16:54:14 2022

@author: nalws
"""
from IPython import get_ipython
get_ipython().magic('reset -sf')
import os
import numpy as np
import nibabel as nib
from matplotlib import pyplot as plt

filename = "D:/TempData/MPRAGE_test.nii"

img = nib.load(filename) # loading image
imgd = img.shape # image dimension
data = img.get_fdata() # get numpy array
hdr = img.header # get header information
iunits = hdr.get_xyzt_units() # get image units

testslice = np.rot90(data[:,:,100]); # 100th axial slice
plt.gray() # gray colormap
plt.imshow(testslice, aspect='auto')