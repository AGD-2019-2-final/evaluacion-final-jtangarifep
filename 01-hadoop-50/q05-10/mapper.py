#!/usr/bin/env python3
import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":
    key_month = None
    val_reg = "1"
    for line in  sys.stdin:
        line = line.strip()
        key_month = line.split("   ")[1]
        sys.stdout.write("{}\t{}\n".format(key_month.split("-")[1],val_reg))
