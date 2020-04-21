# docker-keras - Keras in Docker with Python 3 and TensorFlow on CPU with Jupyter

FROM debian:stretch
MAINTAINER boxxa [https://github.com/boxxa]

# install debian packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq \
 && apt-get install --no-install-recommends -y \
    # install essentials
    build-essential \
    g++ \
    git \
    openssh-client \
    # install python 3
    python3 \
	  python3-dev \
    python3-pip \
    python3-setuptools \
    python3-virtualenv \
    python3-wheel \
    pkg-config \
    # requirements for numpy
    libopenblas-base \
    python3-numpy \
    python3-scipy \
    # requirements for keras
    python3-h5py \
    python3-yaml \
    python3-pydot \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# manually update numpy
RUN pip3 --no-cache-dir install -U numpy==1.13.3

#ARG TENSORFLOW_VERSION=1.12.0
ARG TENSORFLOW_VERSION=1.14.0
ARG TENSORFLOW_DEVICE=cpu
ARG TENSORFLOW_APPEND=
RUN pip3 --no-cache-dir install https://storage.googleapis.com/tensorflow/linux/${TENSORFLOW_DEVICE}/tensorflow${TENSORFLOW_APPEND}-${TENSORFLOW_VERSION}-cp35-cp35m-linux_x86_64.whl

# adding jupyter stuff
RUN pip3 --no-cache-dir install \
    jupyter \
    ipython \
    ipykernel \
    # data analysis (Python 3)
    pandas \
    scikit-learn \
    statsmodels \
    matplotlib \
    mpld3 \
 && python3 -m ipykernel.kernelspec \
 && ipython kernel install

ARG KERAS_VERSION=2.2.4
ENV KERAS_BACKEND=tensorflow
RUN pip3 --no-cache-dir install --no-dependencies git+https://github.com/fchollet/keras.git@${KERAS_VERSION}

COPY jupyter_config.py /root/.jupyter/
COPY jupyter_launch.sh /
RUN chmod +x /jupyter_launch.sh

EXPOSE 8888

WORKDIR /srv/

CMD ["/jupyter_launch.sh"]
