#!/usr/bin/env cwl-runner

cwlVersion: v1.2.0-dev1
class: CommandLineTool
baseCommand: wget
inputs:
  url:
    type: string
    inputBinding:
      position: 50
  out:
    type: string
    inputBinding:
      prefix: -O

outputs:
  downloaded_file:
    type: File
    outputBinding:
      glob: "$(inputs.out)"
