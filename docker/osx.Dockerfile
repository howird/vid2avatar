FROM nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04

# Set up dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential \ 
    wget git neovim ffmpeg

# configure python and install pip
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-pip python3-dev && \
    ln -s $(which python3) /usr/bin/python

# install pytorch+cuda requirements
RUN pip install --no-cache-dir torch==1.11.0+cu113 torchvision==0.12.0+cu113 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip install --no-cache-dir kaolin -f https://nvidia-kaolin.s3.us-east-2.amazonaws.com/torch-1.11.0_cu113.html
RUN pip install --no-cache-dir pytorch3d -f https://dl.fbaipublicfiles.com/pytorch3d/packaging/wheels/py38_cu113_pyt1110/download.html

# Set up OSX and dependecies
RUN cd / && git clone https://github.com/IDEA-Research/OSX.git && \
    cd /OSX && apt-get install -y ffmpeg && \
    pip install openmim && \
    mim install mmcv-full==1.7.1 && \
    pip install -r requirements.txt && \
    cd main/transformer_utils && python setup.py install

# install vid2avatar and its requirements
RUN cd / && git clone https://github.com/howird/vid2avatar && cd /
WORKDIR /vid2avatar
RUN pip install --no-cache-dir --upgrade pip setuptools
RUN pip install --no-cache-dir -r requirements.docker.txt
RUN pip install --no-cache-dir -r requirements.preprocessing.txt
RUN cd /vid2avatar/code && python setup.py develop
