#!/bin/bash

run_workflow() {

    sudo docker run -i -t "5db39ca47927" fastqc -h

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

