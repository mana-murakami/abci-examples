#!/bin/sh
#$ -l h_rt=1:00:00 
#$ -N keras_mnist_test 
#$ -cwd

source /etc/profile.d/modules.sh
source $PWD/load_modules.sh
source $PWD/horovod/bin/activate
          
mpiexec -n 16 -map-by ppr:4:node nvprof -f -o $PWD/examples/keras_mnist/keras_mnist.%q{OMPI_COMM_WORLD_RANK}.nvprof python3 $PWD/examples/keras_mnist/mnist.py
