#!/bin/bash

./tau.py --reffile data/refb.txt --txfile data/trb.txt --absorptance > data/absb.txt
./tau.py --reffile data/reft.txt --txfile data/trt.txt --absorptance > data/abst.txt

./tau.py --reffile data/asd.botref.mn.txt --txfile data/asd.bottx.mn.txt --absorptance > data/asd.botabs.mn.txt
./tau.py --reffile data/asd.topref.mn.txt --txfile data/asd.toptx.mn.txt --absorptance > data/asd.topabs.mn.txt


python li1800plot.py \
    --outfile "out/li1800.ref_w_asd.pdf" \
    --title "Spathiphyllum Leaf Reflectance" \
    --yaxis "" \
    --infiles data/reft.txt data/refb.txt data/asd.topref.mn.txt data/asd.botref.mn.txt \
    --labels "Top Reflectance - LI1800" "Bottom Reflectance - LI1800" "Top Reflectance - ASD" "Bottom Reflectance - ASD"

python li1800plot.py \
    --outfile "out/li1800.tx_w_asd.pdf" \
    --title "Spathiphyllum Leaf Transmittance" \
    --yaxis "" \
    --infiles data/trt.txt data/trb.txt data/asd.toptx.mn.txt data/asd.bottx.mn.txt \
    --labels "Top Transmittance - LI1800" "Bottom Transmittance - LI1800" "Top Transmittance - ASD" "Bottom Transmittance - ASD"

python li1800plot.py \
    --outfile "out/li1800.abs_w_asd.pdf" \
    --title "Spathiphyllum Leaf Absorptance" \
    --yaxis "" \
    --infiles data/abst.txt data/absb.txt data/asd.topabs.mn.txt data/asd.botabs.mn.txt \
    --labels "Top Absorptance - LI1800" "Bottom Absorptance - LI1800" "Top Absorptance - ASD" "Bottom Absorptance - ASD"

