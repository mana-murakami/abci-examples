
import tensorflow as tf
import horovod.tensorflow as hvd

# Initialize Horovod
hvd.init()

config = tf.ConfigProto()
config.gpu_options.allow_growth = True
config.gpu_options.visible_device_list = str(hvd.local_rank())
