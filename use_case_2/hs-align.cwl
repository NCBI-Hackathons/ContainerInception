class: CommandLineTool
cwlVersion: v1.0
requirements:
  - class: DockerRequirement
    dockerPull: limesbonn/hisat2
baseCommand:
  - hisat2
inputs:
  - id: ref
    type: File
    inputBinding:
      position: 0
      prefix: -x
  - id: m1
    type: File
    inputBinding:
      position: 1
      prefix: "-1"
  - id: m2
    type: File
    inputBinding:
      position: 2
      prefix: "-2"
  - id: sam
    type: string
    inputBinding:
      position: 3
      prefix: -S
outputs:
  - id: result
    type:
      type: array
      items: File
    outputBinding:
      glob: "*"
