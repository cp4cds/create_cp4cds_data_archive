#!/usr/bin/python2.7

from sys import argv
from subprocess import call

start = int(argv[1])
files_per_batch = 245
srt_idx = start * files_per_batch
end_idx = srt_idx + files_per_batch

with open("all_files_not_in_gws.log", 'r') as fr:
    files = fr.readlines()

for file in files[srt_idx: end_idx]:
    run_cmd = ["python2.7", "move_cp4cds_data_lotus.py", file.strip()]
    run = call(run_cmd)
    if run != 0:
        print "ERROR RUNNING %s" % run_cmd

