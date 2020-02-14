#!/usr/bin/env python3
import sys

#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    key_val = None
    last_key_val = None
    val_reg = None
    vals =[]
    vals_p = ""
    for line in sys.stdin:
        line = line.strip()
        key_val, val_reg = line.split("\t")
        val_reg = int(val_reg)
        if key_val == last_key_val:
            vals.append(val_reg)
        else:
            if last_key_val is not None: 
                for v in sorted(vals):
                    vals_p = str(vals_p) + str(v) + ","
                sys.stdout.write("{}\t{}\n".format(last_key_val,vals_p[:-1]))
                vals = []
                vals_p = ""
            last_key_val = key_val
            vals.append(val_reg)
            
    

    for v in sorted(vals):
        vals_p = str(vals_p) + str(v) + ","
    sys.stdout.write("{}\t{}\n".format(last_key_val,vals_p[:-1]))