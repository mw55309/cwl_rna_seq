#!/usr/bin/env cwl-runner

cwlVersion: v1.2.0-dev1
class: CommandLineTool
baseCommand: ['/home/ubuntu/cwl_attempts/download_ebi.sh']
inputs:
  runid:
    type: string
    inputBinding:
      position: 50
  outfile:
    type: string
    inputBinding:
      position: 100

outputs:
  fqone:
    type: File
    outputBinding:
      glob: "$(inputs.outfile)" 
