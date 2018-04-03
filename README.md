# ContainerInception
An easy to use framework to build Nested Containerized Workflows

## Use case 1 

Container and no cwl: Most users who use Docker fall under this category. When using containers you are mixing 0 and 1. Docker is supposed to be using one thing at a time. For example one of the authors uses 1,000 lines to create a docker. Difficult to swap in the wrapper script.

[Fastqc -> trimmomatic -> Fastqc -> tophat2] (bash script)

Make a docker image that contains 4 softwares

### Use case 1.1

Multiple (individual) containers with no cwl. Sometimes you have multiple containers but you have to string them together using bash script but it’s not easy stitch them and will mostly be hardcoded

[Fastqc] -> [trimmomatic] -> [Fastqc] -> [tophat2]  (bash script)

Individual containers for each software and no cwl. We will write a bash script

## Use case 2 

Have containers and have cwl/workflow descriptor: It’s difficult to write them or no clear standard and everyone uses cwl. It’s difficult to write but easier to edit them or swap them 

[Fastqc] -> [trimmomatic] -> [Fastqc] -> [tophat2]  (cwl/nf)

Write a cwl/nf for these individual containers

## Use case 3

### Use case 3.1

- Putting them altogether in one container
- Create docker container with tools to run the pipelines.
- Define modularity layers
- Launch/Run via CWLTool/Rabix

[[Fastqc] -> [trimmomatic] -> [Fastqc] -> [tophat2]  (cwl/ )]

### Use case 3.2

Interacting workflows: Two interacting workflows- one workflow (current one) and two other workflows (SNP calling and differential expression analysis)

[[Fastqc] -> [trimmomatic] -> [Fastqc] -> [tophat2]  (cwl/nf)]

+

[[Cuffmerge] -> [cuffdiff] -> [cummerbund] (cwl/nf)] (example pipeline)

