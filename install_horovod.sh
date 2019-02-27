#!/bin/sh

if type "nvidia-smi" > /dev/null 2>&1; then
#    module load python/3.6/3.6.5
#    module load cuda/9.0/9.0.176.4
#    module load cudnn/7.4/7.4.2
#    module load nccl/2.3/2.3.7-1
#    module load openmpi/2.1.5
    source ./load_modules.sh

    python3 -m venv horovod
    source horovod/bin/activate
    pip3 install tensorflow-gpu==1.12.0
    pip3 install horovod
    pip3 install Keras Keras-Applications Keras-Preprocessing

    python -c "from tensorflow.python.client import device_lib; print(device_lib.list_local_devices())"
else
    echo "no nvidia-smi (you may note load cuda module)"
    exit 1
fi
