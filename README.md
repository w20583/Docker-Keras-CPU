# Docker-Keras-Jupyter-TensorFlowCPU-Python3

This is a debain:stretch based Docker image that installs Python3 and a bunch
of tools for Machine Learning. The backend is CPU based Tensorflow and when
the container is started, the console will output the URL to access the Jupyter
notebook and you can start building from there.

Below is a list of the packages installed.
```
numpy 1.13.3
tensorflow 1.5.0 (CPU)
pandas
scikit-learn
matplotlib
mpld3
```


### Building
Clone the repo and build the docker image from the Dockerfile:
```
docker build -t kerascpu .
```

When it is complete, you can run the image by running:
```
docker run -p 8888:8888 kerascpu
```


When the container starts, you will see the console output showing the token to connect with.

Open a browser with the URL and start working with the notebook.

To verify your install, use the following script:
```
# Check the versions of libraries
# Python version
import sys
print('Python: {}'.format(sys.version))
# scipy
import scipy
print('scipy: {}'.format(scipy.__version__))
# numpy
import numpy
print('numpy: {}'.format(numpy.__version__))
# matplotlib
import matplotlib
print('matplotlib: {}'.format(matplotlib.__version__))
# pandas
import pandas
print('pandas: {}'.format(pandas.__version__))
# scikit-learn
import sklearn
print('sklearn: {}'.format(sklearn.__version__))
# tensorflow
import tensorflow as tf
hello = tf.constant('Hello from TensorFlow!')
sess = tf.Session()
print(sess.run(hello))
```

You should see:
```
Python: 3.5.3 (default, Jan 19 2017, 14:11:04)
[GCC 6.3.0 20170118]
scipy: 0.18.1
numpy: 1.13.3
matplotlib: 2.2.2
pandas: 0.23.3
sklearn: 0.19.2
b'Hello from TensorFlow!'
```
