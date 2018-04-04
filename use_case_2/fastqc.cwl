cwlVersion: v1.0
class: CommandLineTool
hints:
  DockerRequirement:
    dockerPull: genomicpariscentre/fastqc
baseCommand: [--outdir, .]
inputs:
  - id: fastqFiles
    inputBinding: 
      position: 1
    type: File[]
outputs:
  - id: html_output
    type: File[]
    outputBinding:
      glob: "*.html"
