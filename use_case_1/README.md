# Use Case 1 

## Motivation
Motivation: A couple of months ago you did an experiment involving read mapping as in use\_case\_0. However, your computing environment changed, say you now work on Mac OS instead of Ubuntu, and you use `tophat2` instead of `hisat2`. The shell script in use\_case\_0 may fail to run on your new Mac, and getting that old shell script to run on your new machine is cumbersome. The following approach avoids this problem. 

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
