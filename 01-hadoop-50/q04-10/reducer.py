#!/usr/bin/env python3
import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#

if __name__ == "__main__":
    key_k1 = None
    key_k2 = None
    val_date = None
    for line in sys.stdin:
        line = line.strip()
        val_date, key_k1, key_k2 = line.split("\t")
        sys.stdout.write("{}\t{}\t{}\n".format( key_k1,val_date,key_k2))

