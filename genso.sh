#!/bin/bash

echo "give file name"
read fname                    #readin file name given with extension

#mv -- "$fname" "${fname%.py}.pyx"

#appending commands to setup.py 
echo "from distutils.core import setup" >> setup.py               
echo "from Cython.Build import cythonize" >> setup.py
echo "setup(
  ext_modules = cythonize('$fname')
)" >> setup.py

#command for creating .so and .c file
python setup.py build_ext --inplace

sleep 5
echo " opration sucessful"





