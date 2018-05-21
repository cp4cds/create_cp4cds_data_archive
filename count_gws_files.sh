#!/bin/bash
# /group_workspaces/jasmin2/cp4cds1/data/alpha/c3scmip5/output1/
# CNRM-CERFACS/CNRM-CM5/piControl/3hr/atmos/3hr/r1i1p1/vas/files/20110819/
# vas_3hr_CNRM-CM5_piControl_r1i1p1_198501010300-199001010000.nc


find /group_workspaces/jasmin2/cp4cds1/data/alpha/c3scmip5/output1/ \
     -mindepth 9 -maxdepth 9 -name files -type d | while read filesdir
     do
        find $filesdir -mindepth 2 -maxdepth 2 -name "*.nc" -type f
     done

