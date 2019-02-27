tf examples for abci hackathon


1. install tensorflow keras horovod
```
$ ./launch_interactive.sh [group id]
$ ./install_horovod.sh
```

2. run mnist example using qsub
```
$ ./launch_batch.sh gaa50123 rt_F=4 examples/keras_mnist
```