#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

hints:
  - class: DockerRequirement
    dockerPull: achave11/trimmimatic_container:1.2

inputs:
  - id : sample_data
    type: 
      type : array
      items: File
    inputBinding:
      position: 1

outputs:
  - id: output
    type:
      type: array
      items: File
    outputBinding:
      glob: "outputs_from_pipeline.zip"

# Change it to bash script
baseCommand: ["/bin/bash","/run_trimmomatic.sh"]
