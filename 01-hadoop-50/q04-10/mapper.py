#!/usr/bin/env python3
import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    key_k1 = None
    key_k2 = None
    val_date = None
    for line in sys.stdin:
        line = line.strip()
        key_k1, val_date, key_k2 = line.split("   ")
        sys.stdout.write("{}\t{}\t{}\n".format(val_date, key_k1,key_k2))

