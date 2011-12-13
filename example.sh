#!/bin/bash

python li1800plot.py \
    --outfile "out/li1800.topandbottom.pdf" \
    --title "Spathiphyllum Leaf Spectra" \
    --infiles data/reft.txt data/trt.txt data/abst.txt data/refb.txt data/trb.txt data/absb.txt \
    --labels "Top Reflectance" "Top Transmittance" "Top Absorptance" \
        "Bottom Reflectance" "Bottom Transmittance" "Bottom Absorptance"

