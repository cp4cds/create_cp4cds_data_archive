
import os

ARCHIVE_BASEDIR = "/badc/cmip5/data/cmip5/output1/"
GWS_BASEDIR = "/group_workspaces/jasmin2/cp4cds1/data/alpha/c3scmip5/output1/"
FILELIST = "valid_all_cp4cds_filelist.log"

def _convert_path(ipath):

    path = ipath.replace(ARCHIVE_BASEDIR, GWS_BASEDIR)
    path_list = path.split('/')
    path_list[-3], path_list[-2] = path_list[-2], path_list[-3]
    gws_path = "/".join(path_list)

    return gws_path


def main():

    # Read in list of valid files
    with open(FILELIST) as fr:
        files = fr.readlines()

    for file in files:
        file = file.strip()
        gws_file = _convert_path(file)

        if os.path.exists(gws_file):
            print(file)
        else:
            with open("missing.log", 'a+') as fw:
                fw.writelines([file+ "\n"])


if __name__ == "__main__":
    main()