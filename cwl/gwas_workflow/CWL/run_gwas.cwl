#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

doc: "run plink on vcf file"

hints:
  - class: DockerRequirement
    dockerPull: elixircloud/plink:1.9-cwl-20200901

  - class: ResourceRequirement
    coresMin: 1
    ramMin: 1024
    outdirMin: 1024

inputs:
  - id: variants
    type: File
    inputBinding:
      position: 1
  - id: ids
    type: File
    inputBinding:
      position: 2
  - id: sex
    type: File
    inputBinding:
      position: 3
  - id: phenotypes
    type: File
    inputBinding:
      position: 4
  - id: covariates
    type: File
    inputBinding:
      position: 5

outputs:
  - id: logistic
    type: File
    outputBinding:
      glob: "*.assoc.logistic"

baseCommand: ["run_gwas.sh"]
