#!/usr/bin/env python3
import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    top = 5
    for line in sys.stdin:
        list_line = line.split("\t")[1]
        if top >= 0:
            sys.stdout.write("{}".format(list_line))
            top -= 1