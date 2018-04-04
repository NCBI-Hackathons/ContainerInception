# Use Case 1.1

This use case runs individual docker images for specific software packages in a combined workflow run through a bash script. Sometimes you have multiple containers but you have to string them together using bash script but it’s not easy stitch them and will mostly be hardcoded

![Settings Window](https://github.com/NCBI-Hackathons/ContainerInception/tree/master/use_case_1.1/docker_workflow_1.1.png)

# Usage
```
Usage: ./uc-1.1.sh -r1 <READ1.fastq.gz> -r2 <READ2.fastq.gz> -a <adapters.fa> -g <ref.fa>

Options:
-r1      --read1     a read1 gzipped FASTQ file
-r2      --read2     a read2 gzipped FASTQ file
-a   --adapters      an adapters FASTA file
-g   --genome-ref    a reference genome FASTA file
```
