#!/usr/bin/env cwl-runner

cwlVersion: v1.2.0-dev1
class: CommandLineTool
baseCommand: ['kallisto', 'index']
inputs:
  fasta:
    type: File
    inputBinding:
      position: 50
  index_out:
    type: string
    inputBinding:
      prefix: -i

outputs:
  index_file:
    type: File
    outputBinding:
      glob: "$(inputs.index_out)"

requirements:
  DockerRequirement:
    dockerPull: "quay.io/biocontainers/kallisto:0.45.0--hdcc98e5_0"
