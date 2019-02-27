#!/bin/sh
#
# Usage: ./launch_batch.sh [group id] [resource name] [script name]
#

if [ $# -ne 3 ]; then
    echo "Usage: ./launch_batch.sh [group id] [resource name] [script name]" 1>&2
    exit 1
fi

case $3 in
*\.sh)
qsub -g $1 -l $2 $3 $PWD 
;;
*)
echo "wrong arguments"
exit 1
;;esac




