#! /usr/bin/env python3
# -*- coding: utf-8 -*-

''' 
filename:   pddlog.py
date:       20171116

script that finds all [plot.log] files listed in BASEDIR/dirlist.conf ( to do! ).
Currently the absolute path to dirname is declared as global variable.

20200519:   executed in end-time - starttime
20220105:   automatically define CURRENT_YEAR
20251219:   added year as cli argument and check if such dir exists
last:       20251219
'''

import os
import sys
import time
import datetime as dt

if len(sys.argv) == 2:
	CURRENT_YEAR = sys.argv[1]
else:
	CURRENT_YEAR = str(dt.datetime.now().year)

# timestamp
def tms():
    return dt.datetime.now().strftime('%Y%m%d_%H%M%S')


# MESSAGE:
print("[ {} ] Started: {}".format(tms(), sys.argv[0]))
dT1=dt.datetime.now().strftime('%S')

# empty list for found filenames
BL = []

# ncrt = 100
ncrt = 3

# current dir
gr_curdir = "/c/Users/gregor.redelonghi/" + CURRENT_YEAR

if not os.path.isdir(gr_curdir):
	print(f"No such directory {gr_curdir}\n")
	sys.exit(1)

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
    print("[ {} ] NO \"{}\" files found!".format(tms(), gr_sptn))
    print("[ {} ] ".format(tms()), end = "")
    # print("-"*(ncrt - 20))
    print("-"*ncrt)
    print("[ {} ] Done!".format(tms()))
    print("-"*ncrt)
    sys.exit(0)

# If files found BL list not empty --> print: number of files and files
gr_nmf = len(BL)
# for L in BL:
    # print(L)

print("[ {} ] {} \"{}\" files found!".format(tms(), gr_nmf, gr_sptn))


for L in BL:
    print("[ {} ] Removing: {}".format(tms(), L))
    os.remove(L)

print("[ {} ] {} files removed.".format(tms(), gr_nmf))

dT2=dt.datetime.now().strftime('%S')
Tdiff = float(dT2) - float(dT1)
print("[ {} ] ".format(tms()), end = "")
print("-"*(ncrt - 20))
print("[ {} ] DONE in {} seconds!".format(tms(), Tdiff))
print("-"*ncrt)
