#!/usr/bin/env python3
import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":  
    for line in sys.stdin:
        credit_hist = None
        line = line.strip()
        credit_hist = line.split(",")[2]
        sys.stdout.write("{}\t1\n".format(credit_hist))