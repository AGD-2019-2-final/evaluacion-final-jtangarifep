#!/usr/bin/env python3
import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":
    key_purpose = None
    last_key_purpose = None
    val_amount = None
    max_amunt = []
    for line in sys.stdin:
        line = line.strip()
        key_purpose, val_amount = line.split("\t")
        val_amount = int(val_amount)
        if last_key_purpose == key_purpose:
            max_amunt.append(val_amount)
        else:
            if last_key_purpose is not None:
                sys.stdout.write("{}\t{}\n".format(last_key_purpose,max(max_amunt)))
            last_key_purpose = key_purpose
            max_amunt = []

    sys.stdout.write("{}\t{}\n".format(last_key_purpose,max(max_amunt)))

