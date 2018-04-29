# Docker-Keras-Jupyter-TensorFlowCPU-Python3

This is a debain:stretch based Docker image that installs Python3 based 
tools for Machine Learning. The backend is CPU based Tensorflow and when 
the container is started, the console will output the URL to access the 

Below is a list of the packages installed.
```
numpy 1.13.3
tensordlow 1.5.0 (CPU)
pandas
scikit-learn
matplotlib
mpld3
```

Once the container runs, you will see the out put of the URL and password to load the notebook interface on port 8888.
