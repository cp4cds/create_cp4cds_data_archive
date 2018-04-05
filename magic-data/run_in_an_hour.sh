#!/bin/bash

sleep 1200
nohup python2.7 copy_magic_data_to_gws.py > copy_magic_to_gws.out 2>&1&
