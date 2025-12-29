process COMBINE_FILES {
  publishDir "results/merged_files", mode: 'copy'

  input:
  tuple val(sample_id), path(reads)

  output:
  path("${sample_id}.merged.txt")

  script:
  """
  cat ${reads} > ${sample_id}.merged.txt
  """
}

reads_ch = Channel.fromFilePairs('hello_{location,world}.nf')

workflow {
  COMBINE_FILES(reads_ch)
}
