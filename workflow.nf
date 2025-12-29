process COMBINE_FILES {
  publishDir "results/merged_files", mode: 'copy'

  input:
  tuple val(sample_id), path(reads)

  output:
  val(sample_id), emit: name
  path("${sample_id}.merged.txt"), emit: merged_files

  script:
  """
  cat ${reads} > ${sample_id}.merged.txt
  """
}

process COMPRESS_FILES {
  publishDir "results/merged_files", mode: 'copy'

  input:
  val(sample_id)
  path(text_file)

  output:
  path("${sample_id}.merged.txt.gz")

  script:
  """
  gzip -f ${text_file} > ${sample_id}.merged.txt.gz
  """
}

workflow {
  reads_ch = Channel.fromFilePairs('hello_{location,world}.nf')
  COMBINE_FILES(reads_ch)
  COMPRESS_FILES(
                 COMBINE_FILES.out.name,
                 COMBINE_FILES.out.merged_files
                )
}
