#!/usr/bin/env python3
import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    key_val = None
    val_reg = None
    for line in sys.stdin:
        line = line.strip()
        key_val, key_fecha, val_reg = line.split("   ")
        sys.stdout.write("{}\t{}\n".format(key_val, val_reg))