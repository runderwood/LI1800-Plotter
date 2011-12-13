import sys
import argparse
import matplotlib.pyplot as pyplot
from numpy import *

def main(args):
    ap = argparse.ArgumentParser(description="Plot generator for LI1800 spectrometer data.")
    ap.add_argument('--title', help="plot title", nargs=1, default="LI1800 Spectra")
    ap.add_argument('--xaxis', help="x axis label", nargs=1, default="wavelength")
    ap.add_argument('--yaxis', help="y axis label", nargs=1, default="intensity")
    ap.add_argument('--labels', help="plot labels", nargs="+")
    ap.add_argument('--infiles', help="input files", nargs="+",required=True)
    params = ap.parse_args(args).__dict__
    plotdata = []
    for infileno,infilenm in enumerate(params["infiles"]):
        infile = open(infilenm,"r")
        try:
            plotnm = params["labels"][infileno]
        except:
            plotnm = infilenm
        rows = []
        for line in infile:
            row = parse_line(line)
            if row:
                rows.append(row)
        plotdata.append((plotnm,rows))
    plot(plotdata,title=params["title"][0])

def parse_line(line):
    parsed = False
    line = line.strip()
    try:
        (wlen,rdg,exp) = line.split(' ')
        rdg = rdg + exp
        wlen = int(wlen)
        rdg = float(rdg)
        parsed = (wlen,rdg)
    except:
        pass
    return parsed

def plot(plotdata,title="LI1800 Spectra",outfilenm="li1800plot"):
    pyplot.figure(1)
    pyplot.title(title)
    for plotnum,plotdatum in enumerate(plotdata):
        plotnm,plotdatum = plotdatum
        plotarr = array(plotdatum)
        pyplot.plot(plotarr[:,0],plotarr[:,1],'-',label=plotnm)
    pyplot.legend(prop={"size": 10})
    pyplot.savefig(outfilenm+".pdf",papertype='a4',orientation='landscape',dpi=300,format='pdf')

if __name__ == "__main__":
    main(sys.argv[1:])
