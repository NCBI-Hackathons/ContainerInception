#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

hints:
  - class: DockerRequirement
    dockerPull: achave11/trimmimatic_container 

inputs:
  - id : sample_data
    type: array
    items: File
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
