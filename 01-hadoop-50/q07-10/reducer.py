#!/usr/bin/env python3
import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    key_val = None
    key_fecha = None
    last_key_val = None
    val_reg = None
    dic_vals = {}
    for line in sys.stdin:
        line = line.strip()
        key_val, key_fecha, val_reg = line.split("\t")
        val_reg = int(val_reg)
        if key_val == last_key_val:
            dic_vals[val_reg] = line
        else:
            if last_key_val is not None: 
                for val in sorted(dic_vals):
                    sys.stdout.write("{}\n".format(dic_vals[val]))
                dic_vals = {}
            last_key_val = key_val
            dic_vals[val_reg] = line
            
    
    for val in sorted(dic_vals):
        sys.stdout.write("{}\n".format(dic_vals[val]))