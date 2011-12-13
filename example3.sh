
#!/bin/bash


./tau.py --reffile data/reft.txt --txfile data/trt.txt > data/tau.top.txt
./tau.py --reffile data/reft.txt --txfile data/trt.txt --alpha > data/alpha.top.txt

./tau.py --reffile data/refb.txt --txfile data/trb.txt > data/tau.bot.txt
./tau.py --reffile data/refb.txt --txfile data/trb.txt --alpha > data/alpha.bot.txt

python li1800plot.py \
    --outfile "out/li1800.alphatau.pdf" \
    --title "Spathiphyllum Leaf Spectra" \
    --yaxis "" \
    --infiles data/tau.top.txt data/alpha.top.txt data/tau.bot.txt data/alpha.bot.txt \
    --labels "Top Transmissivity" "Top Absorptiviy" "Bottom Transmissivity" "Bottom Absorptivity"

