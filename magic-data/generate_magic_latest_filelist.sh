#!/bin/bash
#/badc/cmip5/data/cmip5/output1/MPI-M/MPI-ESM-LR/rcp26/mon/atmos/Amon/r1i1p1/latest/tas/


find /badc/cmip5/data/cmip5/output1/ \
    -mindepth 3 -maxdepth 3 -name historical | while read dir1

do
    find $dir1/mon/atmos/Amon -mindepth 2 -maxdepth 2 -name latest | while read dir2
    do
        find -L $dir2 -mindepth 2 -maxdepth 2 -name 'ua_*.nc'
        find -L $dir2 -mindepth 2 -maxdepth 2 -name 'rlutcs_*.nc'
        find -L $dir2 -mindepth 2 -maxdepth 2 -name 'rsutcs_*.nc'
    done
    
    find ${dir1}/mon/ocean/Omon -mindepth 2 -maxdepth 2 -name latest | while read dir3
    do
        find -L $dir3 -mindepth 2 -maxdepth 2 -name 'msftmyz_*.nc'
    done
    
    find ${dir1}/mon/aerosol/aero/ -mindepth 2 -maxdepth 2 -name latest | while read dir4
    do     
        find -L $dir4 -mindepth 2 -maxdepth 2 -name 'od550aer_*.nc'
    done

    find $dir1/day/atmos/day -mindepth 2 -maxdepth 2 -name latest | while read dir5
    do
        find -L $dir5 -mindepth 2 -maxdepth 2 -name 'prsn_*.nc'
        find -L $dir5 -mindepth 2 -maxdepth 2 -name 'rhs_*.nc'
        find -L $dir5 -mindepth 2 -maxdepth 2 -name 'rsds_*.nc'
        find -L $dir5 -mindepth 2 -maxdepth 2 -name 'zg_*.nc'
        find -L $dir5 -mindepth 2 -maxdepth 2 -name 'ua_*.nc'
        find -L $dir5 -mindepth 2 -maxdepth 2 -name 'ta_*.nc'
    done


    find ${dir1}/3hr/atmos/3hr -mindepth 2 -maxdepth 2 -name latest | while read dir6
    do

        find -L $dir6 -mindepth 2 -maxdepth 2 -name 'uas_*nc'
        find -L $dir6 -mindepth 2 -maxdepth 2 -name 'vas_*nc'
    done


    find ${dir1}/3hr/atmos/cf3hr -mindepth 2 -maxdepth 2 -name latest | while read dir7
    do

        find -L $dir7 -mindepth 2 -maxdepth 2 -name 'evspsbl_*nc'
        find -L $dir7 -mindepth 2 -maxdepth 2 -name 'psl_*nc'
    done

done
