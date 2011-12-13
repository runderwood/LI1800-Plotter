## LI1800/ASD Plotter ##

Requires: Python, python-numpy, python-matplotlib

> python li1800plot.py --outfile "myspectra.pdf" --title "Spathiphyllum Leaf Spectra" --infiles reft.txt trt.txt abst.txt --labels "Top Reflectance" "Top Transmittance" "Top Absorptance"

Check the "exampleX.sh" files for more detailed examples...

The "tau.py" script takes a reflectance data file and a transmittance file and outputs transmissivity (tau) or absorptance (alpha):

> python tau.py --reffile myreflectancefile.txt --txfile mytransmittancefile.txt

> python tau.py --reffile myreflectancefile.txt --txfile mytransmittancefile.txt --alpha
