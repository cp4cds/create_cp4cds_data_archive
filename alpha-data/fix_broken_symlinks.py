import os
import re

def find_links(start_dir):
    for root, dirs, files in os.walk(start_dir):
        for filename in files:
            file_path = os.path.join(root, filename)
            if os.path.islink(file_path):
                yield file_path


def remove_v(path):
    return re.sub("(files/)v([0-9]+/)", "\g<1>\g<2>", path)


def change_links(start_dir, renamer):
    for link_path in find_links(start_dir):
        target = os.readlink(link_path)
        new_target = renamer(target)
        if new_target != target:
            print new_target, link_path
            os.remove(link_path)
            os.symlink(new_target, link_path)
            

if __name__ == '__main__':
    data_dir = "/group_workspaces/jasmin2/cp4cds1/data/alpha/c3scmip5/output1/"
    change_links(data_dir, remove_v)