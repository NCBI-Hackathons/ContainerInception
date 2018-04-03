#!/bin/bash

run_workflow() {

    # run trimmomatic
    #java -jar ~/ContainerInception/softwares/Trimmomatic-0.36/trimmomatic-0.36.jar PE -phred33 sample_1_R1.fq.gz sample_1_R2.fq.gz output_R1_paired.fq.gz output_R1_unpaired.fq.gz output_R2_paired.fq.gz output_R2_unpaired.fq.gz ILLUMINACLIP:../sample_data/Adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36


    # run FastQC
    mkdir -p fastqc_out/fastqc_out
    sudo docker pull fjukstad/fastqc
    sudo docker run -v ${PWD}:/fastqc_out -w /fastqc_out --name fastqc fjukstad/fastqc:latest $1 $2 -o fastqc_out/fastqc_out

}


usage () {

    echo ""
    echo "Usage: ./uc-1.1.sh -r1 <READ1.fastq.gz> -r2 <READ2.fastq.gz>"
    echo ""
    echo "Options:"
    echo -e "-r1 \t --read1 \t a read1 gzipped FASTQ file"
    echo -e "-r2 \t --read2 \t a read2 gzipped FASTQ file"

}

#####################################
#
# argument processing 
#
#####################################

# check input arguments
if [ "$#" -eq 0 ]  || [ "$#" -ne 4 ]; then

    usage; exit 1;

fi

read1=""; read2="";
# read command line arguments
while [ "$1" != "" ]; do
    
    opt=`echo $1 | awk -F= '{print $1}'`
    case $opt in
        
        -h | --help) usage; exit 1;;
        
        -r1 | --read1) read1=$2;; 
            
        -r2 | --read2) read2=$2;;
            
    esac
    shift
done

#########################
#
#   workflow execution
#
#########################
run_workflow $read1 $read2

