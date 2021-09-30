#!/usr/bin/env cwl-runner

cwlVersion: v1.2.0-dev1
class: Workflow

inputs:
  inurl: string
  inout: string
  index: string
  runid: string
  runfastq: string
  runquant: string

steps:
  download:
    run: download_chicken_reference.cwl 
    in:
      url: inurl
      out: inout
#    when: $(inputs.inout < 1)
    out: [downloaded_file]

  kallisto_index:
    run: kallisto_index.cwl
    in: 
      fasta: download/downloaded_file
      index_out: index
    out: [index_file]

  get_fastq:
    run: download_ebi.cwl
    in:
      runid: runid
      outfile: runfastq      
    out: [fqone]

  kallisto_quant:
    run: kallisto_quant.cwl
    in:
      fastq: get_fastq/fqone
      index: kallisto_index/index_file
      outdir: runquant
    out: [quantdir]

outputs:
  kallisto_index_file:
    type: File
    outputSource: kallisto_index/index_file

  fqone:
    type: File
    outputSource: get_fastq/fqone

  quantdir:
    type: Directory
    outputSource: kallisto_quant/quantdir
  

requirements:
  InlineJavascriptRequirement: {}
  MultipleInputFeatureRequirement: {}
