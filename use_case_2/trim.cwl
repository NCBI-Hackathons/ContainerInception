cwlVersion: v1.0
class: CommandLineTool
hints:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/trimmomatic:0.36--5
baseCommand: trimmomatic
inputs:
  - id: mode
    type: string
    inputBinding: 
      position: 1
  - id: inputFile1
    type: File
    inputBinding:
      position: 2
  - id: inputFile2
    type: File
    inputBinding:
      position: 3
  - id: outputFile1P
    type: string
    inputBinding:
      position: 4
  - id: outputFile1U
    type: string
    inputBinding:
      position: 5
  - id: outputFile2P
    type: string
    inputBinding:
      position: 6
  - id: outputFile2U
    type: string
    inputBinding:
      position: 7
  - id: adaptersFile
    type: File
  - id: params
    type: string
    inputBinding:
      position: 99
outputs:
  - id: trim_results
    type:
      type: array
      items: File
    outputBinding:
      glob: "*"
