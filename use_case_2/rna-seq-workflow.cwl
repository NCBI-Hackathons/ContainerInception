#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:

  mod: string
  input1: File
  input2: File
  outFile1P: string
  outFile1U: string
  outFile2P: string
  outFile2U: string
  adapters_File: File
  parameters: string
  ref_in: File
  index_base: string
  fqfiles: File[]
  #reference: File
  #first_read: File
  #second_read: File
  #sam_file: string

outputs:
  - id: trim_results
    type:
      type: array
      items: File
    outputSource: trim/trim_results
  - id: build_result
    type:
      type: array
      items: File
    outputSource: build/build_result
  - id: html_output
    type:
      type: array
      items: File
    outputSource: fastqc/html_output

#  - id: result_align
#    type:
#      type: array
#      items: File
#    outputSource: align/result_align

steps:
  trim:
    run: trim.cwl
    in:
      mode: mod
      inputFile1: input1
      inputFile2: input2
      outputFile1P: outFile1P
      outputFile1U: outFile1U
      outputFile2P: outFile2P
      outputFile2U: outFile2U
      params: parameters
      adaptersFile: adapters_File
    out: [trim_results]
  fastqc:
    run: fastqc.cwl
    in:
      fastqFiles: [fqfiles]
    out: [html_output]
  build:
    run: hs-build.cwl
    in:
      reference_in: ref_in
      ht2_index_base: index_base
    out: [build_result]

#  align:
#    run: hs-align.cwl
#    in: 
#      ref: reference
#      m1: first_read
#      m2: second_read
#      sam: sam_file
#    out: [result_align]


