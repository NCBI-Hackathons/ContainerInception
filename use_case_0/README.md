# Installation instructions

## Fastqc
```
wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
unzip fastqc_v0.11.7.zip 
cd FastQC
chmod +x fastqc
export PATH=/home/ubuntu/ContainerInception/softwares/FastQC/:$PATH
```

## Trimmomatic
```
wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip
unzip Trimmomatic-0.36.zip
``` 

## Bowtie2
```
wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.3.4.1/bowtie2-2.3.4.1-linux-x86_64.zip
export PATH=/home/ubuntu/ContainerInception/softwares/bowtie2-2.3.4.1-linux-x86_64/:$PATH
```

## Tophat2
```
wget https://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.1.Linux_x86_64.tar.gz
tar xvf tophat-2.1.1.Linux_x86_64.tar.gz 
export PATH=/home/ubuntu/ContainerInception/softwares/tophat-2.1.1.Linux_x86_64/:$PATH
```

# Python
```
sudo apt-get install -y python-pip
```

# Running commands

## Fastqc
```
mkdir fastqc_out
fastqc ~/ContainerInception/sample_data/sample_1_R1.fq.gz ~/ContainerInception/sample_data/sample_1_R2.fq.gz -o fastqc_out
```

## Trimmomatic
```
cp ~/ContainerInception/sample_data/Adapters.fa .

java -jar ~/ContainerInception/softwares/Trimmomatic-0.36/trimmomatic-0.36.jar PE -threads 4 ~/ContainerInception/sample_data/sample_1_R1.fq.gz ~/ContainerInception/sample_data/sample_2_R2.fq.gz output_forward_paired.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz ILLUMINACLIP:Adapters.fa:2:40:15 HEADCROP:7 SLIDINGWINDOW:4:15 MINLEN:45
```

## Fastqc
```
mkdir fastqc_out_trim
fastqc output_forward_paired.fq.gz output_reverse_paired.fq.gz -o fastqc_out_trim
```

## Tophat2
```
bowtie2-build ~/ContainerInception/sample_data/reference_genome.fa ~/ContainerInception/sample_data/reference_genome

tophat2 -p 4 -G ~/ContainerInception/sample_data/reference.gtf -o tophat_out ~/ContainerInception/sample_data/reference_genome.fa output_forward_paired.fq.gz output_reverse_paired.fq.gz

tophat2 -p 4 -G ~/ContainerInception/sample_data/reference.gtf -o tophat_out ~/ContainerInception/sample_data/reference_genome trimout/output_forward_paired.fq.gz trimout/output_reverse_paired.fq.gz output_reverse_paired.fq.gz 
```

# Running as wrapper script

```
bash case_0_wrapper.sh -h

Usage : sh case_0_wrapper.sh -g <reference_genome> -A <reference_annotation> {-1 <left_reads> -2 <right_reads> | -U <single_reads> } -p num_threads -m mode -t trim_file -a adapter_file

  
  ###### Command line options ##########
  -g <reference genome fasta file>
  -A <reference genome annotation>
  -1 <reads_1>
               # Make sure both the paired end reads are present
  -2 <reads_2>
  -U <single_reads> # Don not use Single Reads along with Paired end reads
  -p Number of threads
  -t trim file
  -a adapter_file
```

```
bash case_0_wrapper.sh -g ../sample_data/reference_genome.fa -A ../sample_data/reference.gtf -1 ../sample_data/sample_1_R1.fq.gz -2 ../sample_data/sample_1_R2.fq.gz -m PE -t ../sample_data/testfile_trimmomatic.txt -a ../sample_data/Adapters.fa -p 4
```