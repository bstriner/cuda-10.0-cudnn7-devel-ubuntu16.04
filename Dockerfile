FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04
# cuda-10.0-cudnn7-devel-ubuntu16.04
# docker build . -t cuda-10.0-cudnn7-devel-ubuntu16.04
# docker run -it cuda-10.0-cudnn7-devel-ubuntu16.04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
RUN apt-get install -y screen terminator tmux vim wget
RUN apt-get install -y aptitude build-essential cmake g++ gfortran git pkg-config software-properties-common
RUN apt-get install -y unrar wget curl
RUN apt-get install -y ffmpeg
RUN apt-get install -y gnuplot-x11
RUN apt-get install -y python3 python3-dev python3-pip
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade setuptools wheel cython
RUN python3 -m pip install --upgrade numpy h5py dill matplotlib mock protobuf tqdm

#Bazel
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y pkg-config zip g++ zlib1g-dev unzip python
RUN mkdir -p /pkg/bazel
WORKDIR /pkg/bazel
RUN wget https://github.com/bazelbuild/bazel/releases/download/0.26.1/bazel-0.26.1-installer-linux-x86_64.sh
RUN chmod a+x bazel-0.26.1-installer-linux-x86_64.sh
RUN ./bazel-0.26.1-installer-linux-x86_64.sh
