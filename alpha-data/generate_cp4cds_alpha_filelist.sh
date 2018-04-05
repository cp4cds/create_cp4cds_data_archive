#!/bin/bash

find -L /badc/cmip5/data/cmip5/output1/ \
    -mindepth 3 -maxdepth 3 \
    \( -name historical -or -name piControl -or -name amip -or -name rcp26 -or -name rcp45 -or -name rcp60 -or -name rcp85 \) | while read dir1

do
    find -L $dir1/mon/atmos/Amon -mindepth 2 -maxdepth 2 -name "v????????" | while read dir2
    do
        find -L $dir2/ -type f -name 'tas_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'ts_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'tasmax_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'tasmin_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'psl_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'ps_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'uas_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'vas_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'sfcWind_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'hurs_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'huss_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'pr_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'prsn_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'evspsbl_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'tauu_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'tauv_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'hfls_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'hfss_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'rlds_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'rlus_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'rsds_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'rsus_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'rsdt_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'rsut_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'rlut_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'clt_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'mrsos_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'mrro_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'snw_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'tos_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'sos_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'zos_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'sic_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'sit_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'snd_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'sim_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'tsice_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'ta_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'ua_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'va_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'hur_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'hus_*.nc' -printf "%p\t%k\n"
        find -L $dir2/ -type f -name 'zg_*.nc' -printf "%p\t%k\n"
    done

    find -L $dir1/day/atmos/day -mindepth 2 -maxdepth 2 -name "v????????" | while read dir3
    do
        find -L $dir3/ -type f -name 'tas_*.nc' -printf "%p\t%k\n"
        find -L $dir3/ -type f -name 'tasmax_*.nc' -printf "%p\t%k\n"
        find -L $dir3/ -type f -name 'tasmin_*.nc' -printf "%p\t%k\n"
        find -L $dir3/ -type f -name 'psl_*.nc' -printf "%p\t%k\n"
        find -L $dir3/ -type f -name 'sfcWind_*.nc' -printf "%p\t%k\n"
        find -L $dir3/ -type f -name 'huss_*.nc' -printf "%p\t%k\n"
        find -L $dir3/ -type f -name 'pr_*.nc' -printf "%p\t%k\n"

    done
done
