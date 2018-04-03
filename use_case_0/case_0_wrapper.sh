#!/bin/bash

usage() {
      echo ""
      echo "Usage : sh $0 -g <reference_genome> -A <reference_annotation> {-1 <left_reads> -2 <right_reads> | -U <single_reads> } -p num_threads -m mode -t trim_file -a adapter_file"
      echo ""

cat <<'EOF'
  
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

EOF
    exit 0
}

while getopts ":hg:A:1:2:U:m:t:a:p:" opt; do
  case $opt in
    g)
    referencegenome=$OPTARG # Reference genome file
     ;;
    A)
    referenceannotation=$OPTARG # Reference genome annotation
     ;;
    1)
    left_reads=$OPTARG # Left reads
     ;;
    2)
    right_reads=$OPTARG # Right reads
     ;;
    U)
    single_reads=$OPTARG # single end reads
     ;;
    m)
    mode=$OPTARG # SE or PE
     ;;
    t)
    trim_file=$OPTARG # trimfile
     ;;
    a)
    adapter_file=$OPTARG
     ;;  
    p)
    num_threads=$OPTARG # Number of threads
     ;;
    h)
    usage
     exit 1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

cuts=`cat $trim_file | grep -v \#`

mkdir trimout fastqc_out_trim

cp $referencegenome .

new=$(basename $referencegenome ".fa")

bowtie2-build reference_genome.fa $new

cp $adapter_file .

if [ $mode == PE ]; then
       	     
	     java -jar -Xmx1024m ../softwares/Trimmomatic-0.36/trimmomatic-0.36.jar $mode -threads $num_threads $left_reads $right_reads trimout/output_forward_paired.fq.gz trimout/output_forward_unpaired.fq.gz trimout/output_reverse_paired.fq.gz trimout/output_reverse_unpaired.fq.gz $cuts 
         fastqc trimout/output_forward_paired.fq.gz trimout/output_reverse_paired.fq.gz -o fastqc_out_trim
         tophat2 -p $num_threads -G $referenceannotation -o tophat_out $new trimout/output_forward_paired.fq.gz trimout/output_reverse_paired.fq.gz
         exit

elif [ $mode == SE ]; then
        
        java -jar -Xmx1024m ../softwares/Trimmomatic-0.36/trimmomatic-0.36.jar $mode -threads $num_threads $single_reads trimout/output.fq.gz $cuts        
        fastqc trimout/output.fq.gz -o fastqc_out_trim
        tophat2 -p $num_threads -G $referenceannotation -o tophat_out $new trimout/output.fq.gz
        exit
fi
