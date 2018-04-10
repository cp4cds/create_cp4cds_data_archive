#!/bin/bash
#/badc/cmip5/data/cmip5/output1/MPI-M/MPI-ESM-LR/rcp26/mon/atmos/Amon/r1i1p1/latest/tas/


find /badc/cmip5/data/cmip5/output1/ \
    -mindepth 3 -maxdepth 3 \
    \( -name historical -or -name piControl -or -name amip -or -name rcp26 -or -name rcp45 -or -name rcp60 -or -name rcp85 \) | while read basedir

do
    find $basedir/mon/atmos/Amon -mindepth 2 -maxdepth 2 -name latest | while read dirAmon
    do
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'tas_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'ts_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'tasmax_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'tasmin_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'psl_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'ps_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'uas_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'vas_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'sfcWind_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'hurs_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'huss_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'pr_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'prsn_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'evspsbl_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'tauu_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'tauv_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'hfls_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'hfss_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'rlds_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'rlus_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'rsds_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'rsus_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'rsdt_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'rsut_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'rlut_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'clt_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'ta_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'ua_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'va_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'hur_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'hus_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'zg_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'rlutcs_*.nc'
        find -L $dirAmon -mindepth 2 -maxdepth 2 -name 'rsutcs_*.nc'
    done

    find $basedir/day/atmos/day -mindepth 2 -maxdepth 2 -name latest | while read dirDay
    do
        find -L $dirDay -mindepth 2 -maxdepth 2 -name 'tas_*.nc'
        find -L $dirDay -mindepth 2 -maxdepth 2 -name 'tasmax_*.nc'
        find -L $dirDay -mindepth 2 -maxdepth 2 -name 'tasmin_*.nc'
        find -L $dirDay -mindepth 2 -maxdepth 2 -name 'psl_*.nc'
        find -L $dirDay -mindepth 2 -maxdepth 2 -name 'sfcWind_*.nc'
        find -L $dirDay -mindepth 2 -maxdepth 2 -name 'huss_*.nc'
        find -L $dirDay -mindepth 2 -maxdepth 2 -name 'pr_*.nc'
        find -L $dirDay -mindepth 2 -maxdepth 2 -name 'prsn_*.nc'
        find -L $dirDay -mindepth 2 -maxdepth 2 -name 'rhs_*.nc'
        find -L $dirDay -mindepth 2 -maxdepth 2 -name 'rsds_*.nc'
        find -L $dirDay -mindepth 2 -maxdepth 2 -name 'zg_*.nc'
        find -L $dirDay -mindepth 2 -maxdepth 2 -name 'ua_*.nc'
        find -L $dirDay -mindepth 2 -maxdepth 2 -name 'ta_*.nc'
    done

    find ${basedir}/3hr/atmos/3hr -mindepth 2 -maxdepth 2 -name latest | while read dir3hr
    do

        find -L $dir3hr -mindepth 2 -maxdepth 2 -name 'uas_*nc'
        find -L $dir3hr -mindepth 2 -maxdepth 2 -name 'vas_*nc'
    done


    find ${basedir}/3hr/atmos/cf3hr -mindepth 2 -maxdepth 2 -name latest | while read dircf3hr
    do

        find -L $dircf3hr -mindepth 2 -maxdepth 2 -name 'evspsbl_*nc'
        find -L $dircf3hr -mindepth 2 -maxdepth 2 -name 'psl_*nc'
    done

    find $basedir/mon/land/Lmon -mindepth 2 -maxdepth 2 -name latest | while read dirLmon
    do
        find -L $dirLmon -mindepth 2 -maxdepth 2 -name 'mrsos_*.nc'
        find -L $dirLmon -mindepth 2 -maxdepth 2 -name 'mrro_*.nc'
    done


    find $basedir/mon/landIce/LImon -mindepth 2 -maxdepth 2 -name latest | while read dirLImon
    do
        find -L $dirLImon -mindepth 2 -maxdepth 2 -name 'snw_*.nc'
    done


    find $basedir/mon/ocean/Omon -mindepth 2 -maxdepth 2 -name latest | while read dirOmon
    do
        find -L $dirOmon -mindepth 2 -maxdepth 2 -name 'tos_*.nc'
        find -L $dirOmon -mindepth 2 -maxdepth 2 -name 'sos_*.nc'
        find -L $dirOmon -mindepth 2 -maxdepth 2 -name 'zos_*.nc'
        find -L $dirOmon -mindepth 2 -maxdepth 2 -name 'msftmyz_*.nc'
    done

    find ${basedir}/mon/aerosol/aero/ -mindepth 2 -maxdepth 2 -name latest | while read dirAero
    do
        find -L $dirAero -mindepth 2 -maxdepth 2 -name 'od550aer_*.nc'
    done

    find $basedir/mon/seaIce/OImon -mindepth 2 -maxdepth 2 -name latest | while read dirOImon
    do
        find -L $dirOImon -mindepth 2 -maxdepth 2 -name 'sic_*.nc'
        find -L $dirOImon -mindepth 2 -maxdepth 2 -name 'snd_*.nc'
        find -L $dirOImon -mindepth 2 -maxdepth 2 -name 'sit_*.nc'
        find -L $dirOImon -mindepth 2 -maxdepth 2 -name 'sim_*.nc'
        find -L $dirOImon -mindepth 2 -maxdepth 2 -name 'tsice_*.nc'
    done

done
