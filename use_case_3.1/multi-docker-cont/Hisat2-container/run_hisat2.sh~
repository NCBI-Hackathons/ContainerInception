#!bin/bash

# Provision the runner
wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.1.0-Linux_x86_64.zip
# Unzip it
unzip hisat2-2.1.0-Linux_x86_64.zip

#Convenient provisioning for cwltool
cp hisat2-2.1.0/* .

export PATH=$PWD/hisat2-2.1.0/:$PATH

# Running commands
hisat2-build ../sample_data/reference_genome.fa reference_genome -p 4

hisat2 -x reference_genome -1 ../sample_data/sample_1_R1.fq.gz -2 ../sample_data/sample_1_R2.fq.gz -p 4 > test.sam

hisat2 -x reference_genome -U ../sample_data/sample_1_R1.fq.gz -p 4 > test.sam

ls
