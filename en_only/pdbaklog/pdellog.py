#! /usr/bin/env python3
# -*- coding: utf-8 -*-

''' 
filename:   pdellog.py
date:       20171116

script that finds all [plot.log] files in CURDIR and subdirs.
'''

import os
import sys
import time
import datetime as dt

# timestamp
def tms():
    return dt.datetime.now().strftime('%Y%m%d_%H%M%S')



# MESSAGE:
print("[ {} ] Started: {}".format(tms(), sys.argv[0]))

# empty list for found filenames
BL = []

# current dir
gr_curdir = os.getcwd()

# search pattern (*.bak, *.log -- test = *.txt)
gr_sptn = "plot.log"

# Informing ...
print("[ {} ] Looking for \"{}\" files in: {}".format(tms(), gr_sptn, gr_curdir))

# Insert found filenames into BL list (absolute pathnames)
for root, dirs, files in os.walk(gr_curdir):
    for name in files:
        full_path = os.path.join(root, name)
        if gr_sptn in full_path:
            # RELATIVE PATH
            # BL.append(full_path)
            
            # FULL == ABSOLUTE PATHNAME
            BL.append(os.path.abspath(full_path))

# If no file found --> BL list is empty
if BL == []:
    print("[ {} ] No \"{}\" files found!".format(tms(), gr_sptn))
    print("[ {} ] DONE!\n".format(tms()))
    sys.exit(1)

# If files found BL list not empty --> print: number of files and files
gr_nmf = len(BL)
for L in BL:
    print(L)

print("\n[ {} ] {} \"{}\" files found!".format(tms(), gr_nmf, gr_sptn))

# DELETE?
gr_ans2 = input("[ {} ] Do you wont to delete these files? [y/n] ".format(tms()))

if gr_ans2 in ["y", "Y", "yes", "YES"]:
    for L in BL:
        print("Removing: {}".format(L))
        os.remove(L)
    
    print()
    print("[ {} ] {} files removed.".format(tms(), gr_nmf))
    print("[ {} ] DONE!".format(tms()))

else:
    print("[ {} ] No files removed.".format(tms()))
    print("[ {} ] DONE!".format(tms()))
    sys.exit(1)

