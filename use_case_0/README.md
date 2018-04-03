# Installation instructions
# Fastqc
ubuntu@ip-172-30-0-74:~/softwares$ wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip

ubuntu@ip-172-30-0-74:~/softwares$ unzip fastqc_v0.11.7.zip 

ubuntu@ip-172-30-0-74:~/softwares/FastQC$ chmod +x fastqc


# Trimmomatic
ubuntu@ip-172-30-0-74:~/softwares/Trimmomatic-0.36$ wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip

ubuntu@ip-172-30-0-74:~/softwares/Trimmomatic-0.36$ unzip Trimmomatic-0.36.zip 

ubuntu@ip-172-30-0-74:~/softwares/Trimmomatic-0.36$ ./trimmomatic-0.36.jar -h


# Tophat2
ubuntu@ip-172-30-0-74:~/softwares$ wget https://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.1.Linux_x86_64.tar.gz

ubuntu@ip-172-30-0-74:~/softwares$ tar xvf tophat-2.1.1.Linux_x86_64.tar.gz 

ubuntu@ip-172-30-0-74:~/softwares/tophat-2.1.1.Linux_x86_64$ sudo apt-get install -y python-pip

ubuntu@ip-172-30-0-74:~/softwares/tophat-2.1.1.Linux_x86_64$ ./tophat --version

