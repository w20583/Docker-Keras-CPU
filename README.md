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
Clone the repo and build the docker image from the Dockerfile.
```
docker build -t keras-cpu .
```

When it is complete, you can run the image by running
```
docker run keras-cpu
```


When the container starts, you will see the console output showing the token to connect with.

Open a browser with the URL and start working with the notebook.
