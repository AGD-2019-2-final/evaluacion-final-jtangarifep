#!/usr/bin/env python3
import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    sum_amount = 0
    last_purpose = None
    key_purpose = None
    val_amount = None
    for line in sys.stdin:
        line = line.strip()
        key_purpose = line.split(",")[3]
        val_amount = line.split(",")[4]
        sys.stdout.write("{}\t{}\n".format(key_purpose,val_amount))