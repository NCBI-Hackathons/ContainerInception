[![logo](../generate_flowchart/flowChartImages/GerberLogo.w100.png)](/README.md)

# Use case 0: No containers and no CWL.

![alt text](../generate_flowchart/flowChartImages/useCase0.png)

----------

# Installation instructions

## Trimmomatic
```
wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip
unzip Trimmomatic-0.36.zip
```

## Fastqc
```
wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
unzip fastqc_v0.11.7.zip
cd FastQC
chmod +x fastqc
export PATH=/home/ubuntu/ContainerInception/softwares/FastQC/:$PATH
```

## Hisat2
```
wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.1.0-Linux_x86_64.zip
unzip hisat2-2.1.0-Linux_x86_64.zip
export PATH=/home/ubuntu/ContainerInception/softwares/hisat2-2.1.0/:$PATH
```

# Running commands

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

## Hisat2
```
hisat2-build reference_genome.fa reference_genome -p 4

hisat2 -x reference_genome -1 ../sample_data/sample_1_R1.fq.gz -2 ../sample_data/sample_1_R2.fq.gz -p 4 > test.sam

hisat2 -x reference_genome -U ../sample_data/sample_1_R1.fq.gz -p 4 > test.sam
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
# PE
bash case_0_wrapper.sh -g ../sample_data/reference_genome.fa -1 ../sample_data/sample_1_R1.fq.gz -2 ../sample_data/sample_1_R2.fq.gz -m PE -t ../sample_data/testfile_trimmomatic.txt -a ../sample_data/Adapters.fa -p 4

# SE
bash case_0_wrapper.sh -g ../sample_data/reference_genome.fa -U ../sample_data/sample_1_R1.fq.gz -m SE -t ../sample_data/testfile_trimmomatic.txt -a ../sample_data/Adapters.fa -p 4
```
