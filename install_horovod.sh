#!/bin/sh

if type "nvidia-smi" > /dev/null 2>&1; then

    source ./load_modules.sh

    python3 -m venv horovod
    source horovod/bin/activate
    pip3 install tensorflow-gpu==1.12.0
    pip3 install horovod
    pip3 install Keras Keras-Applications Keras-Preprocessing
    pip3 install cupy-cuda90

    python -c "from tensorflow.python.client import device_lib; print(device_lib.list_local_devices())"
    python -c "import cupy"
else
    echo "no nvidia-smi (you may note load cuda module)"
    exit 1
fi
