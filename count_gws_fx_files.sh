#!/bin/bash
# /group_workspaces/jasmin2/cp4cds1/data/alpha/c3scmip5/output1/
# CNRM-CERFACS/CNRM-CM5/piControl/fx/
# atmos/fx/r0i0p0/orog/files/20130826/orog_fx_CNRM-CM5_piControl_r0i0p0.nc


find /group_workspaces/jasmin2/cp4cds1/data/alpha/c3scmip5/output1/ \
     -mindepth 4 -maxdepth 4 -name fx -type d | while read fxdir
     do
        find $fxdir -mindepth 5 -maxdepth 5 -name files -type d | while read filesdir
        do
            find $filesdir -mindepth 2 -maxdepth 2 -name "*.nc" -type f
        done
     done

