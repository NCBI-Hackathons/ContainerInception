WORKDIR /data

# trimmomatic
RUN wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip
RUN unzip Trimmomatic-0.36.zip

# FastQC
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
RUN unzip fastqc_v0.11.7.zip 
RUN cd FastQC
RUN chmod +x fastqc
RUN export PATH=/home/ubuntu/ContainerInception/softwares/FastQC/:$PATH

# Hisat2
RUN wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.1.0-Linux_x86_64.zip
RUN unzip hisat2-2.1.0-Linux_x86_64.zip
RUN export PATH=/home/ubuntu/ContainerInception/softwares/hisat2-2.1.0/:$PATH

# Install compiler and perl stuff
RUN apt-get install --yes build-essential git \
    build-essential \
    curl \
    python \ 
    python2.7-dev \
    python-pip \
    python-numpy \
    python-matplotlib \
      
