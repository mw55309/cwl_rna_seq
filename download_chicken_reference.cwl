#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: CommandLineTool
baseCommand: curl
inputs:
  url:
    type: string
    inputBinding:
      position: 50
  out:
    type: string
    inputBinding:
      prefix: -o

outputs:
  downloaded_file:
    type: File
    outputBinding:
      glob: "$(inputs.out)"

requirements:
  DockerRequirement:
    dockerPull: "quay.io/biocontainers/curl:7.62.0"
  NetworkAccess:
    networkAccess: true
