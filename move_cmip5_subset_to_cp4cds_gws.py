#!/usr/bin/env python
"""
This program is for the CP4CDS project, it takes a file name in the form

INPUT: /badc/cmip5/data/cmip5/output1/MOHC/HadGEM2-ES/rcp45/mon/atmos/Amon/r1i1p1/v20110329/tas/tas_Amon_HadGEM2-ES_rcp45_r1i1p1_203012-205511.nc
INPUT DRS: <activity>.<output>.<institute>.<model>.<experiment>.<frequency>.<realm>.<table>.<ensemble>.<version>.<variable>.<file.nc>
from a file and moves this to
OUTPUT DRS: <activity>.<output>.<institute>.<model>.<experiment>.<frequency>.<realm>.<table>.<ensemble>.<variable>.<version>.<file.nc>
the files will be moved to the CP4CDS groupworkspace: /group_workspaces/jasmin/cp4cds1/data/c3s_test/c3scmip5/output1/

The group workspace will replicate the file structure of cmip5
/files - actual files
/latest - symlink to most recent version directory
/vYYYYMMDD - symlink to version files
/vYYYYMMDD - symlink to version files
"""

import os, sys, re, glob, time, datetime
import shutil

# INCLUDES FACETS <activity>.<output>
ARCHIVE_BASEDIR = "/badc/cmip5/data/cmip5/output1/"
GWS_BASEDIR = "/group_workspaces/jasmin2/cp4cds1/data/alpha/c3scmip5/output1/"

#GWS_BASEDIR = "/home/users/rpetrie/cp4cds/cp4cds_cmip5_data_restructure/alpha-data/data/alpha/c3scmip5/output1/"

#/badc/cmip5/data/cmip5/output1/MPI-M/MPI-ESM-P/piControl/mon/atmos/Amon/r1i1p1/latest/va/
# va_Amon_MPI-ESM-P_piControl_r1i1p1_221001-221912.nc

#/badc/cmip5/data/cmip5/output1/MPI-M/MPI-ESM-P/piControl/mon/atmos/Amon/r1i1p1/va/files/20001001
# va_Amon_MPI-ESM-P_piControl_r1i1p1_221001-221912.nc

#/badc/cmip5/data/cmip5/output1/MPI-M/MPI-ESM-P/piControl/mon/atmos/Amon/r1i1p1/va/v20122121/
# va_Amon_MPI-ESM-P_piControl_r1i1p1_221001-221912.nc --> ../files/va/va_nc

#/badc/cmip5/data/cmip5/output1/MPI-M/MPI-ESM-P/piControl/mon/atmos/Amon/r1i1p1/va/latest/ --> v20122121

def create_c3s_alpha_data():
    """
    Routine that copies all subset of CMIP5 data to the  CP4CDS GWS
    Using a variable level DRS
    Reconstructs symbolic links and versioning

    :param source_basedir: /badc/cmip5
    :param dest_basedir: /group_workspace/jasmin/cp4cds/data/
    """
    with open('valid_cp4cds_alpha_update.txt', 'r') as fr:
        c3s_files = fr.readlines()

    for c3s_file in c3s_files:

        c3s_file = c3s_file.strip()

        institute, model, experiment, frequency, realm, table, ensemble, variable, ncfile = parse_filename(c3s_file)

        v_version_dir = os.readlink(os.path.join('/', *c3s_file.split('/')[:-2]))
        version = v_version_dir.strip('v')

        dataset_dir = os.path.join(GWS_BASEDIR, institute, model, experiment, frequency, realm, table, ensemble, variable)

        # MAKE VARIABLE LEVEL FILES DIRECTORY AND COPY DATA TO FILES DIRECTORY
        dest_files_dir = os.path.join(dataset_dir, 'files', version)

        if not os.path.isdir(dest_files_dir):
            os.makedirs(dest_files_dir)

        dest_file = os.path.join(dest_files_dir, ncfile)
        shutil.copy(c3s_file, dest_file)

        print "COPIED: %s:%s" % (c3s_file, dest_file)


        # MAKE A VERSION DIRECTORY AND SYMLINK TO THE FILE IN FILES DIRECTORY
        dest_version_dir = os.path.join(dataset_dir, v_version_dir)
        if not os.path.isdir(dest_version_dir):
            os.makedirs(dest_version_dir)

        # Create relative version symlink
        os.chdir(dest_version_dir)
        link_target = os.path.join('../files/', version, ncfile)
        link_src = os.path.join(dest_version_dir, ncfile)
        if not os.path.islink(link_src):
            os.symlink(link_target, link_src)

        # MAKE LATEST DIR SYMLINK TO MOST RECENT VERSION

        os.chdir(dataset_dir)
        link_target = v_version_dir
        link_src = 'latest'
        if not os.path.islink(link_src):
            os.symlink(link_target, link_src)
        



        # var_version_dir = variable + '_' + version.strip('v')
        #
        # # Remove any existing 'latest' directory symlink
        # if os.path.isdir('latest'):
        #     os.remove('latest')
        #
        # try:
        #     # Get list of all versions
        #     version_dirs = [vfile.lstrip('v') for vfile in glob.glob("v????????")]
        #
        #     if len(version_dirs) > 1:
        #         newest = "v" + max([datetime.date(int(v[0:4]), int(v[4:6]), int(v[6:8])) for v in version_dirs]).strftime('%Y%m%d')
        #         oldest = "v" + min([datetime.date(int(v[0:4]), int(v[4:6]), int(v[6:8])) for v in version_dirs]).strftime('%Y%m%d')
        #
        #         # Create a symlink to the newest version
        #         os.symlink(newest, 'latest')
        #         os.remove(oldest)
        #     else:
        #         os.symlink("v" + version_dirs[0], 'latest')
        #     print "COMPLETED: %s:%s" % (c3s_file, dest_file)
        #
        # except:
        #     print "VERSIONING ERROR: %s " % c3s_file
        #

def parse_filename(filename):
    """
    Routine to parse CMIP5 filename into consituent facets
    :returns: institute, model, experiment, frequency, realm, table, ensemble, version, variable, ncfile
    """

    facets = [part.strip() for part in filename.split("/")]
    institute, model, experiment, frequency, realm, table, ensemble, latest, variable, ncfile = facets[6:]
    return institute, model, experiment, frequency, realm, table, ensemble, variable, ncfile


if __name__ == "__main__":
    create_c3s_alpha_data()
