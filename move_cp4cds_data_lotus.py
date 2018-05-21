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
from sys import argv


# INCLUDES FACETS <activity>.<output>
ARCHIVE_BASEDIR = "/badc/cmip5/data/cmip5/output1/"
GWS_BASEDIR = "/group_workspaces/jasmin2/cp4cds1/data/alpha/c3scmip5/output1/"

# /badc/cmip5/data/cmip5/output1/
#    BCC/bcc-csm1-1-m/historical/mon/atmos/Amon/r3i1p1/
#       latest/tasmin/tasmin_Amon_bcc-csm1-1-m_historical_r3i1p1_185001-201212.nc
# -> ../../files/tasmin_20120709/tasmin_Amon_bcc-csm1-1-m_historical_r3i1p1_185001-201212.nc
#
# MOVE TO
#
# GWS/
#    BCC/bcc-csm1-1-m/historical/mon/atmos/Amon/r3i1p1/
#       tasmin/
#          files/20120709/tasmin_Amon_bcc-csm1-1-m_historical_r3i1p1_185001-201212.nc
#  smb:    v20120709/tasmin_Amon_bcc-csm1-1-m_historical_r3i1p1_185001-201212.nc -->  ../files/tasmin_Amon_bcc-csm1-1-m_historical_r3i1p1_185001-201212.nc
#  smb:    latest --> v20120709
#  smb:    latest/tasmin_Amon_bcc-csm1-1-m_historical_r3i1p1_185001-201212.nc --> ../files/tasmin_Amon_bcc-csm1-1-m_historical_r3i1p1_185001-201212.nc


def _convert_path(ipath):

    path = ipath.replace(ARCHIVE_BASEDIR, GWS_BASEDIR)
    path_list = path.split('/')
    path_list[-3], path_list[-2] = path_list[-2], path_list[-3]
    gws_path = "/".join(path_list)

    return gws_path


def in_cp4cds_gws():

    with open("valid_all_cp4cds_filelist.log") as fr:
        files = fr.readlines()

    for file in files:
        file = file.strip()
        gws_file = _convert_path(file)
        if not os.path.exists(gws_file):
            print(file)
            # with open("valid_cp4cds_files_missing_from_gws.log", "wa+") as fw:
            #     fw.writelines(file)


def create_c3s_alpha_data(c3s_file):
    """
    Routine that copies all subset of CMIP5 data to the  CP4CDS GWS
    Using a variable level DRS
    Reconstructs symbolic links and versioning

    :param source_basedir: /badc/cmip5
    :param dest_basedir: /group_workspace/jasmin2/cp4cds1/data/
    """
    c3s_file = c3s_file.strip()
    print("c3sfile {}".format(c3s_file))

    institute, model, experiment, frequency, realm, table, ensemble, variable, ncfile = parse_filename(c3s_file)
    v_version_dir = os.readlink(os.path.join('/', *c3s_file.split('/')[:-2]))
    version = v_version_dir.strip('v')
    dataset_dir = os.path.join(GWS_BASEDIR, institute, model, experiment, frequency, realm, table, ensemble, variable)

    # MAKE VARIABLE LEVEL FILES DIRECTORY AND COPY DATA TO FILES DIRECTORY
    dest_files_dir = os.path.join(dataset_dir, 'files', version)
    print(dest_files_dir)
    if not os.path.isdir(dest_files_dir):
        os.makedirs(dest_files_dir)

    dest_file = os.path.join(dest_files_dir, ncfile)
    shutil.copy(c3s_file, dest_file)

    # MAKE A VERSION DIRECTORY AND SYMLINK TO THE FILE IN FILES DIRECTORY
    dest_version_dir = os.path.join(dataset_dir, v_version_dir)

    if not os.path.isdir(dest_version_dir):
        os.makedirs(dest_version_dir)

    # Create relative version symlink
    os.chdir(dest_version_dir)
    link_src = os.path.join('../files/', version, ncfile)
    link_name = os.path.join(dest_version_dir, ncfile)
    if not os.path.islink(link_name):
        os.symlink(link_src, link_name)

    # MAKE LATEST DIR SYMLINK TO MOST RECENT VERSION
    os.chdir(dataset_dir)
    link_src = v_version_dir
    link_name = 'latest'
    if not os.path.islink(link_name):
        os.symlink(link_src, link_name)


def parse_filename(filename):
    """
    Routine to parse CMIP5 filename into consituent facets
    :returns: institute, model, experiment, frequency, realm, table, ensemble, version, variable, ncfile
    """

    facets = [part.strip() for part in filename.split("/")]
    institute, model, experiment, frequency, realm, table, ensemble, latest, variable, ncfile = facets[6:]
    return institute, model, experiment, frequency, realm, table, ensemble, variable, ncfile


if __name__ == "__main__":
    file = argv[1]
    create_c3s_alpha_data(file)

    # in_cp4cds_gws()