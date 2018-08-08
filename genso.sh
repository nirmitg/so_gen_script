#!/bin/bash

echo "Input:"
echo "[1] for filename"
echo "[2] for foldername"
read input                    #readin file name or folder name given with extension

if (($input == 1))
then
    echo "Enter filename"
    read fname
    #appending commands to setup.py 
    echo "from distutils.core import setup" >> setup.py               
    echo "from Cython.Build import cythonize" >> setup.py
    echo "setup(ext_modules = cythonize('$fname'))" >> setup.py

    #command for creating .so and .c file
    python setup.py build_ext --inplace

    sleep 5
    echo "Conversion Sucessful"
elif(($input == 2))
then
    #Creating .so of all .py file in the folder 
    echo "Enter foldername" 
    read foldername
    cd $foldername
    filename=$(ls  | grep .*.py$)
    num_py=$(ls  | grep .*.py$| wc -l)
    if (($num_py == 0))
    then
        echo "There are no .py files"
    else
        for file in $filename
        do
            echo "********************************************"
            #appending commands to setup.py 
            echo "from distutils.core import setup" >> setup.py               
            echo "from Cython.Build import cythonize" >> setup.py
            echo "setup(ext_modules = cythonize('$file'))" >> setup.py

            #command for creating .so and .c file
            python setup.py build_ext --inplace
        
           sleep 3
           echo ""
           echo "$file converted to .so"
           echo "********************************************"
           echo "" 
        done 
        echo "Conversion Sucessful"
    fi
else
    echo ""
    echo "[ERROR] Wrong input"
    echo "Input:"
    echo "[1] for filename"
    echo "[2] for foldername"
    echo ""
    echo "Please try again"
fi
