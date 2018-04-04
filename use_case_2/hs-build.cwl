class: CommandLineTool
cwlVersion: v1.0
requirements:
  - class: DockerRequirement
    dockerPull: limesbonn/hisat2
baseCommand:
  - hisat2-build
inputs:
  - id: reference_in
    type: File
    inputBinding:
      position: 0
  - id: ht2_index_base
    type: string
    inputBinding:
      position: 1
outputs:
  - id: build_result
    type:
      type: array
      items: File
    outputBinding:
      glob: "*"
