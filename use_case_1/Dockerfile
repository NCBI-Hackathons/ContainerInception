WORKDIR /data

RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
RUN unzip fastqc_v0.11.7.zip 
RUN cd FastQC
RUN chmod +x fastqc
RUN export PATH=/home/ubuntu/ContainerInception/softwares/FastQC/:$PATH

# Install compiler and perl stuff
RUN apt-get install --yes build-essential git \
    build-essential \
    curl \
    python \ 
    python2.7-dev \
    python-pip \
    python-numpy \
    python-matplotlib \
      
