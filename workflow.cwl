#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

label: Kallisto RNA-seq example

inputs:
  reference: File?
  reference_url: string
  reference_filename: string
  index: File?
  index_filename: string
  runid: string
  runfastq: File?
  runfastq_filename: string
  runquant: string


steps:
  download:
    run: download_chicken_reference.cwl
    in:
      url: reference_url
      reference: reference
      out: reference_filename
    when: $(inputs.reference === null)
    out: [downloaded_file]

  kallisto_index:
    run: kallisto_index.cwl
    in:
      fasta:
        source: [download/downloaded_file, reference]
        pickValue: the_only_non_null
      index_out: index_filename
      index: index
    when: $(inputs.index === null)
    out: [index_file]

  get_fastq:
    run: download_ebi.cwl
    in:
      runid: runid
      outfile: runfastq_filename
      runfastq: runfastq
    when: $(inputs.runfastq === null)
    out: [fqone]

  kallisto_quant:
    run: kallisto_quant.cwl
    in:
      fastq:
        source: [get_fastq/fqone, runfastq]
        pickValue: the_only_non_null
      index:
        source: [kallisto_index/index_file, index]
        pickValue: the_only_non_null
      outdir: runquant
    out: [quantdir]

outputs:
  kallisto_index_file:
    type: File
    outputSource: [kallisto_index/index_file, index]
    pickValue: the_only_non_null

  fqone:
    type: File
    outputSource: [get_fastq/fqone, runfastq]
    pickValue: the_only_non_null

  quantdir:
    type: Directory
    outputSource: kallisto_quant/quantdir

requirements:
  InlineJavascriptRequirement: {}
  MultipleInputFeatureRequirement: {}
