import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#

if __name__ == "__main__":
    key_month = None
    last_key_month = None
    val_reg = None
    total_reg = 0
    for line in sys.stdin:
        line = line.strip()
        key_month, val_reg = line.split("\t")
        val_reg = int(val_reg)
        if key_month == last_key_month:
            total_reg += val_reg
        else:
            if last_key_month is not None:
                sys.stdout.write("{}\t{}\n".format(last_key_month,total_reg))
            last_key_month = key_month
            total_reg = val_reg
    
    sys.stdout.write("{}\t{}\n".format(last_key_month,total_reg))