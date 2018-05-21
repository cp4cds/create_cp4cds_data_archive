#!/bin/bash
# This is the starter program and calls the batchup_cp4cds_movefiles.py
odir=lotus-logs/
mkdir -p $odir

for batch in $(seq 0 202); do
    bsub -o ./$odir/%J.out -W 24:00 python2.7 batchup_cp4cds_movefiles.py $batch
done
