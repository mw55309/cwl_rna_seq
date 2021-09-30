# cwl_rna_seq
A very basic CWL RNA-Seq workflow using Kallisto

You're going to have to edit download_ebi.cwl to provide the full and correct path to download_ebi.sh - I haven't figured out how to reference local scripts yet - though I found this which helps: https://github.com/common-workflow-language/user_guide/issues/158

This currently works with ```/usr/bin/cwl-runner 2.0.20200224214940``` 

Run:

```
cwl-runner --enable-dev workflow.cwl inputs.yaml
```
