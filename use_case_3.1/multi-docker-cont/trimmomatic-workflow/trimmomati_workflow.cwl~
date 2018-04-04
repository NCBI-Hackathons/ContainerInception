#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

hints:
  - class: DockerRequirement
    dockerPull: quay.io/biocontainers/trimmomatic:0.36--5 # Change this to personal container pulling this.
inputs:
  input_files:
    type: array
    items: File
    default: sample_data
    inputBinding:
      position: 1

outputs:
  - id: output
    type:
      type: array
      items: File
    outputBinding:
      glob: "*paired.fq.fz"

# Change it to bash script
baseCommand: ["/workspace/./run_trimmomatic.sh"]