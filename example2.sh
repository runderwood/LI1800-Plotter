#!/bin/bash

python li1800plot.py \
    --outfile "li1800.w_asd.pdf" \
    --title "Spathiphyllum Leaf Spectra" \
    --yaxis "" \
    --infiles data/reft.txt data/refb.txt data/asd.topref.mn.txt data/asd.botref.mn.txt \
    --labels "Top Reflectance" "Top Transmittance" "Top Absorptance" \
        "Bottom Reflectance" "Bottom Transmittance" "Bottom Absorptance"

