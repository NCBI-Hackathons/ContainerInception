#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

hints:
  - class: DockerRequirement
    dockerPull: quay.io/biocontainers/trimmomatic:0.36--5 # Change this to personal container pulling this.
inputs:
  - id: src
    type: File
    inputBinding:
      position: 1
outputs: []

# Change it to bash script
baseCommand: ["python", "/checker/checker_tool.py"]