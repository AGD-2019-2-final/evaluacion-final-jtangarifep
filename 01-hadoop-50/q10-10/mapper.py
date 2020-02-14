#!/usr/bin/env python3
import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    key_vals = None
    val_reg = None
    list_keys = []
    for line in sys.stdin:
        line = line.strip()
        val_reg, key_vals = line.split("\t")
        list_keys = key_vals.split(",")
        for key in list_keys:
            sys.stdout.write("{}\t{}\n".format(key, val_reg ))

