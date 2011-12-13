#!/bin/bash

python li1800plot.py \
    --outfile "li1800.topandbottom.pdf" \
    --title "Spathiphyllum Leaf Spectra" \
    --infiles reft.txt trt.txt abst.txt refb.txt trb.txt absb.txt \
    --labels "Top Reflectance" "Top Transmittance" "Top Absorptance" \
        "Bottom Reflectance" "Bottom Transmittance" "Bottom Absorptance"

