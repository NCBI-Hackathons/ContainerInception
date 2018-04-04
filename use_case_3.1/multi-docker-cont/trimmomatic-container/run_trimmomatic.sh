#!bin/bash

java -jar trimmomatic-0.36.jar PE -threads 4 sample_data/sample_1_R1.fq.gz sample_data/sample_2_R2.fq.gz trim_out/output_forward_paired.fq.gz trim_out/output_forward_unpaired.fq.gz trim_out/output_reverse_paired.fq.gz trim_out/output_reverse_unpaired.fq.gz ILLUMINACLIP:Adapters.fa:2:40:15 HEADCROP:7 SLIDINGWINDOW:4:15 MINLEN:45