#!/bin/bash

python li1800plot.py \
    --outfile "li1800.topandbottom.pdf" \
    --title "Spathiphyllum Leaf Spectra" \
    --yaxis "" \
    --infiles reft.txt refb.txt ../asd2/06topref.mn.txt \
    --labels "Top Reflectance" "Top Transmittance" "Top Absorptance" \
        "Bottom Reflectance" "Bottom Transmittance" "Bottom Absorptance"

