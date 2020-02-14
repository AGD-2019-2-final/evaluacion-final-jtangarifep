#!/usr/bin/env python3
import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":
    count_credit_hist = 0
    credit_hist = None
    last_credit_hist = None
    val_credit_hist = None
    for line in sys.stdin:
        line = line.strip()
        credit_hist, val_credit_hist = line.split("\t")
        val_credit_hist = int(val_credit_hist)
        if last_credit_hist == credit_hist:
            count_credit_hist +=  val_credit_hist
        else:
            if last_credit_hist is not None:
                sys.stdout.write("{}\t{}\n".format(last_credit_hist,count_credit_hist))
            last_credit_hist = credit_hist
            count_credit_hist =  val_credit_hist

    sys.stdout.write("{}\t{}\n".format(last_credit_hist,count_credit_hist))
    
            

