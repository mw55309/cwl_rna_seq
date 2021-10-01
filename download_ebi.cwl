#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: CommandLineTool
inputs:
  runid: string
  outfile: string
  script:
    type: File
    default:
      class: File
      location: download_ebi.sh

arguments: [$(inputs.script), $(inputs.runid), $(inputs.outfile)]

outputs:
  fqone:
    type: File
    outputBinding:
      glob: "$(inputs.outfile)"

requirements:
  DockerRequirement:
    dockerPull: "quay.io/biocontainers/curl:7.62.0"
  NetworkAccess:
    networkAccess: true
