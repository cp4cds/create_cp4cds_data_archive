#!/bin/bash
#/badc/cmip5/data/cmip5/output1/MPI-M/MPI-ESM-LR/rcp26/mon/atmos/Amon/r1i1p1/latest/tas/


find /badc/cmip5/data/cmip5/output1/ \
    -mindepth 3 -maxdepth 3 \
    \( -name historical -or -name piControl -or -name amip -or -name rcp26 -or -name rcp45 -or -name rcp60 -or -name rcp85 \) | while read dir1

do
    find $dir1/mon/land/Lmon -mindepth 2 -maxdepth 2 -name latest | while read dir2
    do
        find -L $dir2 -mindepth 2 -maxdepth 2 -name 'mrsos_*.nc'
        find -L $dir2 -mindepth 2 -maxdepth 2 -name 'mrro_*.nc'
    done


    find $dir1/mon/landIce/LImon -mindepth 2 -maxdepth 2 -name latest | while read dir2
    do
        find -L $dir2 -mindepth 2 -maxdepth 2 -name 'snw_*.nc'
    done


    find $dir1/mon/ocean/Omon -mindepth 2 -maxdepth 2 -name latest | while read dir2
    do
        find -L $dir2 -mindepth 2 -maxdepth 2 -name 'tos_*.nc'
        find -L $dir2 -mindepth 2 -maxdepth 2 -name 'sos_*.nc'
        find -L $dir2 -mindepth 2 -maxdepth 2 -name 'zos_*.nc'
    done


    find $dir1/mon/seaIce/OImon -mindepth 2 -maxdepth 2 -name latest | while read dir2
    do
        find -L $dir2 -mindepth 2 -maxdepth 2 -name 'sic_*.nc'
        find -L $dir2 -mindepth 2 -maxdepth 2 -name 'snd_*.nc'
        find -L $dir2 -mindepth 2 -maxdepth 2 -name 'sit_*.nc'
        find -L $dir2 -mindepth 2 -maxdepth 2 -name 'sim_*.nc'
        find -L $dir2 -mindepth 2 -maxdepth 2 -name 'tsice_*.nc'    
    done



done
