[![logo](../generate_flowchart/flowChartImages/GerberLogo.w100.png)](../README.md)

# Use Case 1

## Motivation: Laptop to server

You build a pipeline on your Macbook Air and everything works well on a minimal data set. Your full blown experiment requires multiple cores and you need to move the pipeline to a powerful server that runs Ubuntu. Your software may fail to run on Ubuntu, and getting that old shell script to run on the new server is cumbersome. The following approach avoids this problem.

# Requirements

- [Docker](https://docs.docker.com/install/)

```
sudo docker build -t use_case_1:1.0 .
```

# Usage

```
sudo docker run -v /home/ubuntu/ContainerInception/sample_data/:/data -w /data use_case_1:1.0 -h
```

> Make sure that the input files are in your current working directory before running.

```
Usage: ./uc-1.1.sh -r1 <READ1.fastq.gz> -r2 <READ2.fastq.gz> -a <adapters.fa> -t <trim_file> -g <ref.fa>

Options:
-r1 	 --read1 	 a read1 gzipped FASTQ file
-r2 	 --read2 	 a read2 gzipped FASTQ file
-a 	 --adapters 	 an adapters FASTA file
-t 	 --trimfile 	 a trim file for trimmomatic
-g 	 --genome-ref 	 a reference genome FASTA file
```

# Example

```
sudo docker run -v /home/ubuntu/ContainerInception/sample_data/:/data -w /data use_case_1:1.0 -r1 sample_1_R1.fq.gz -r2 sample_1_R2.fq.gz -a Adapters.fa -t testfile_trimmomatic.txt -g reference_genome.fa
```
