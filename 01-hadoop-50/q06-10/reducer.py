#!/usr/bin/env python3
import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    key_val = None
    last_key_val = None
    val_reg = None
    vals = []
    for line in sys.stdin:
        line = line.strip()
        key_val, val_reg = line.split("\t")
        if key_val == last_key_val:
            vals.append(val_reg)
        else:
            if last_key_val is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(last_key_val, max(vals),min(vals)))
                vals = []
            last_key_val = key_val
            vals.append(val_reg)
            
    
    sys.stdout.write("{}\t{}\t{}\n".format(last_key_val,max(vals),min(vals)))