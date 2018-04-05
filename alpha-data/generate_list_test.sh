#!/bin/bash
#/badc/cmip5/data/cmip5/output1/MPI-M/MPI-ESM-LR/rcp26/mon/atmos/Amon/r1i1p1/latest/tas/tas_*.nc


#!/bin/bash
#/badc/cmip5/data/cmip5/output1/MPI-M/MPI-ESM-LR/rcp26/mon/atmos/Amon/r1i1p1/latest/tas/


find /badc/cmip5/data/cmip5/output1/ \
    -mindepth 3 -maxdepth 3 \
    \( -name historical -or -name rcp85 \) | while read dir1

do
    find $dir1/mon/atmos/Amon -mindepth 2 -maxdepth 2 -name latest | while read dir2
    do
        find -L $dir2 -mindepth 2 -maxdepth 2 -name 'tas_*.nc'

    done

done