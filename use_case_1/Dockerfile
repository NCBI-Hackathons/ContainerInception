FROM ubuntu:14.04

# Install dependencies
RUN apt-get update && apt-get install -y build-essential wget unzip default-jdk python-pip

# Set working directory
WORKDIR /software

# Fastqc
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip && \
 	unzip fastqc_v0.11.7.zip && \
 	chmod +x /software/FastQC/fastqc && \
 	rm /software/fastqc_v0.11.7.zip

# Trimmomatic
RUN wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip && \
	unzip Trimmomatic-0.36.zip && \
	rm /software/Trimmomatic-0.36.zip

# Hisat2
RUN wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.0.5-Linux_x86_64.zip && \
	unzip hisat2-2.0.5-Linux_x86_64.zip && \
	rm /software/hisat2-2.0.5-Linux_x86_64.zip

ENV PATH /software/FastQC/:$PATH
ENV PATH /software/hisat2-2.0.5/:$PATH

# Add wrapper script
ADD uc-1.sh /usr/bin
RUN chmod +x /usr/bin/uc-1.sh

# ENTRYPOINT
ENTRYPOINT ["uc-1.sh"]