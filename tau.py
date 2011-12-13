#!/usr/bin/env python

import sys
import argparse
from numpy import *

def main(args):
    ap = argparse.ArgumentParser(description="Output transmissivity/absorptivity values for a pair of reflectance and transmittance files.")
    ap.add_argument('--reffile', help="reflectance file", nargs=1, required=True)
    ap.add_argument('--txfile', help="transmittance file", nargs=1, required=True)
    ap.add_argument('--alpha', help="print absorptivity (alpha) rather than transmissivity (tau)", default=False, action="store_true")
    ap.add_argument('--absorptance', help="print absorptance rather than tau or alpha", default=False, action="store_true")
    params = ap.parse_args(args).__dict__
    reffile = open(params["reffile"][0],"r")
    txfile = open(params["txfile"][0],"r")
    refrows = []
    txrows = []
    for line in reffile:
        parsed = parse_line(line)
        if parsed:
            refrows.append(parsed)
    for line in txfile:
        parsed = parse_line(line)
        if parsed:
            txrows.append(parsed)
    refarr = array(refrows)
    txarr = array(txrows)
    absarr = 1.0 - (refarr[:,1] + txarr[:,1])
    tauarr = txarr[:,1] / (1.0 - refarr[:,1])
    alpharr = 1.0 - tauarr
    if params["alpha"]:
        tauarr = alpharr
    elif params["absorptance"]:
        tauarr = absarr
    for i,tau in enumerate(tauarr):
        print "%d %0.4e" % (refarr[i,0],tau)

def parse_line(line):
    parsed = False
    line = line.strip()
    try:
        toks = line.split(' ')
        if len(toks) == 2:
            wlen,rdg = toks
        elif len(toks) == 3:
            (wlen,rdg,exp) = toks
            rdg = rdg + exp
        wlen = int(wlen)
        rdg = float(rdg)
        parsed = (wlen,rdg)
    except:
        pass
    return parsed


if __name__ == "__main__":
    main(sys.argv[1:])
