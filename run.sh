#!/bin/bash

#
# GridPP and DIRAC: running CERN@school frame processing on the grid.
#
# This script gets passed to the grid job to run the CVMFS Python scripts.
#
# Parameters:
# * $1 : the CVMFS location of the CERN@school clustering software;
# * $2 : the file to run the process-frame.py script on.
#

export PATH=$1/lib/:$PATH

echo "PATH is:"
echo $PATH
echo

# Add the Python modules from the CVMFS repo to the PYTHONPATH.
export PYTHONPATH=$1/lib/python2.6/site-packages/:$1/lib/:$PYTHONPATH

echo "PYTHONPATH is:"
echo $PYTHONPATH
echo

# Add the supporting libraries to the library linking path.
export LD_LIBRARY_PATH=$1/lib/:$LD_LIBRARY_PATH
echo "LD_LIBRARY_PATH is:"
echo $LD_LIBRARY_PATH
echo

echo "Running the script 'process-frame.py' on datafile:" 
echo $2
echo

# Run the Python script in the CVMFS directory.
/usr/bin/python $1/process-frame.py $2
