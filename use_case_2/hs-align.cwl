class: CommandLineTool
cwlVersion: v1.0
requirements:
  - class: DockerRequirement
    dockerPull: limesbonn/hisat2
  - class: InlineJavascriptRequirement
baseCommand:
  - hisat2
inputs:
  - id: ref
    type: File
    inputBinding:
      position: 0
      prefix: -x
    secondaryFiles:
      - '$(self.basename).1.ht2'
      - '$(self.basename).2.ht2'
      - '$(self.basename).3.ht2'
      - '$(self.basename).4.ht2'
      - '$(self.basename).5.ht2'
      - '$(self.basename).6.ht2'
      - '$(self.basename).7.ht2'
      - '$(self.basename).8.ht2'
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
  - id: result_align
    type:
      type: array
      items: File
    outputBinding:
      glob: "*"
