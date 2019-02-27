#!/bin/sh
#
# Usage: ./launch_interactive.sh [group id]
#

if [ $# -ne 1 ]; then
    echo "Usage: ./launch_interactive.sh [group id]" 1>&2
    exit 1
fi

qrsh -g $1 -l rt_F=1 -l h_rt=01:00:00


