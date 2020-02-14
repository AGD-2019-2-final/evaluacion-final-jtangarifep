#!/usr/bin/env python3
import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":
    key_reg = None
    val_reg = None
    for line in sys.stdin:
        line = line.strip()
        val_reg, key_reg = line.split("\t")       
        sys.stdout.write("{},{}\n".format(key_reg,val_reg))