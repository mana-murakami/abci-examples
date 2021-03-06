#!/bin/sh
#$ -l rt_F=4 
#$ -l h_rt=1:00:00 
#$ -N keras_mnist_test 
#$ -cwd



source /etc/profile.d/modules.sh
source $PWD/load_modules.sh
source $PWD/horovod_cupy/bin/activate
          
#mpiexec --output-filename $PWD/keras_mnist -n 16 -map-by ppr:4:node python3 $PWD/mnist.py
mpiexec -n 16 -map-by ppr:4:node nvprof -f -o $PWD/examples/keras_mnist/keras_mnist.%q{OMPI_COMM_WORLD_RANK}.nvvp python3 $PWD/examples/keras_mnist/mnist_nvtx.py
