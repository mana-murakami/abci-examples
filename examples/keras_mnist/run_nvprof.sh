#!/bin/sh
#$ -l h_rt=1:00:00 
#$ -N keras_mnist_test 
#$ -cwd

source /etc/profile.d/modules.sh
source $1/load_modules.sh
source $1/horovod/bin/activate
          
mpiexec -n 16 -map-by ppr:4:node nvprof -o keras_mnist.%q{OMPI_COMM_WORLD_RANK}.nvprof python3 $1/keras_mnist/mnist.py
