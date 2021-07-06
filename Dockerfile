FROM ubuntu:18.04
MAINTAINER Mohamed BEN ALI <mbenali@linagora.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git zlib1g-dev make automake autoconf bzip2 wget libtool subversion libatlas3-base python python3 g++ bc sox gfortran unzip

WORKDIR /home/mohamed-linagora/kaldi_docker
RUN git clone https://github.com/kaldi-asr/kaldi.git
 

WORKDIR /home/mohamed-linagora/kaldi_docker/kaldi/tools
RUN extras/check_dependencies.sh && \
        extras/install_mkl.sh && \
	make && \
	extras/install_irstlm.sh

WORKDIR /home/mohamed-linagora/kaldi_docker/kaldi/src
RUN bash configure  && \
	make depend && \
	make
WORKDIR /home/mohamed-linagora/kaldi_docker/kaldi/tools
RUN extras/install_kaldi_lm.sh
VOLUME home/mohamed-linagora/kaldi_docker/data
CMD [ "sh", "-c", "service ssh start; bash"]

