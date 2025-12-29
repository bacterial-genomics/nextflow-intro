process COUNT_FILES {
  script:
  """
  count_files.py --add 7
  """
}

workflow {
  COUNT_FILES()
}
