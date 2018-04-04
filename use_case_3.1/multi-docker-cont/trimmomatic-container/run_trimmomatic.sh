#!bin/bash
wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip
unzip Trimmomatic-0.36.zip
mv Trimmomatic-0.36/* .
java -jar trimmomatic-0.36.jar PE -threads 4 /var/lib/cwl/*/sample_1_R1.fq.gz /var/lib/cwl/*/sample_2_R2.fq.gz output_forward_paired.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz ILLUMINACLIP:/Adapters.fa:2:40:15 HEADCROP:7 SLIDINGWINDOW:4:15 MINLEN:45

tar -zcvf outputs_from_pipeline.zip output_forward_paired.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz
