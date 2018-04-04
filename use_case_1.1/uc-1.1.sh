#!/bin/bash

run_workflow() {

    cuts=`cat $5 | grep -v \#`

    # run trimmomatic
    if [ ! -d trim_out ] ; then mkdir trim_out; fi
    sudo docker run -v ${PWD}:/data -w /data --entrypoint trimmomatic quay.io/biocontainers/trimmomatic:0.36--5 PE -threads 4 $1 $2 trim_out/output_forward_paired.fq.gz trim_out/output_forward_unpaired.fq.gz trim_out/output_reverse_paired.fq.gz trim_out/output_reverse_unpaired.fq.gz $cuts

    # run FastQC
    if [ ! -d fastqc_out ]; then mkdir -p fastqc_out/fastqc_out; fi
    sudo docker run -v ${PWD}:/fastqc_out -w /fastqc_out --name fastqc fjukstad/fastqc:latest trim_out/trim_out/output_forward_paired.fq.gz trim_out/output_reverse_paired.fq.gz -o fastqc_out/fastqc_out

    # run hisat2
    if [ ! -d hisat_out ]; then mkdir hisat_out; fi
    sudo docker run -v ${PWD}:/data -w /data --entrypoint hisat2-build limesbonn/hisat2:latest -f $4 "hisat_out/${4%.*}"
    sudo docker run -v ${PWD}:/data -w /data  --entrypoint hisat2 limesbonn/hisat2:latest -x hisat_out/reference_genome -1 trim_out/output_forward_paired.fq.gz -2 trim_out/output_reverse_paired.fq.gz -S hisat_out/output.sam

}

# usage message
usage () {

    echo ""
    echo "Usage: ./uc-1.1.sh -r1 <READ1.fastq.gz> -r2 <READ2.fastq.gz> -a <adapters.fa> -g <ref.fa>"
    echo ""
    echo "Options:"
    echo -e "-r1 \t --read1 \t a read1 gzipped FASTQ file"
    echo -e "-r2 \t --read2 \t a read2 gzipped FASTQ file"
    echo -e "-a \t --adapters \t an adapters FASTA file"
    echo -e "-t \t --trimfile \t a trim file for trimmomatic"
    echo -e "-g \t --genome-ref \t a reference genome FASTA file"

}

#####################################
#
# argument processing 
#
#####################################

# prune existing containers
#sudo docker system prune -f 

# check input arguments
if [ "$#" -eq 0 ]  || [ "$#" -ne 10 ]; then

    usage; exit 1;

fi

read1=""; read2="";
# read command line arguments
while [ "$1" != "" ]; do
    
    opt=`echo $1 | awk -F= '{print $1}'`
    case $opt in
        
        -h | --help) usage; exit 1;;
        
        -r1 | --read1) read1=`basename $2`;; 
            
        -r2 | --read2) read2=`basename $2`;;
           
        -a | --adapters) adapters=`basename $2`;;

        -t | --trimfile) trimfile=`basename $2`;;

        -g | --genome-ref) reference=`basename $2`;;
 
    esac
    shift
done

#########################
#
#   workflow execution
#
#########################
run_workflow $read1 $read2 $adapters $reference $trimfile

