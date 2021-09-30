#!/usr/bin/env cwl-runner

cwlVersion: v1.2.0-dev1
class: CommandLineTool
baseCommand: ['kallisto', 'quant', '--single', '-l', '200', '-s', '50']
inputs:
  fastq:
    type: File
    inputBinding:
      position: 100
  index:
    type: File
    inputBinding:
      prefix: -i
  outdir:
    type: string
    inputBinding:
      prefix: -o
    
outputs:
  quantdir:
    type: Directory
    outputBinding:
      glob: "$(inputs.outdir)"

requirements:
  DockerRequirement:
    dockerPull: "quay.io/biocontainers/kallisto:0.45.0--hdcc98e5_0"
