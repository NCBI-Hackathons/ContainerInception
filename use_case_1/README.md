# Use Case 1
This use case involves a Docker container and no workflow language like cwl - most users who use Docker fall under this category. When using containers you are mixing 0 and 1. Docker is supposed to be using one thing at a time. For example one of the authors uses 1,000 lines to create a docker. This can be difficult to swap in the wrapper script.

# Requirements
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
