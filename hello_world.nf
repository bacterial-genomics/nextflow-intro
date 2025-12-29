#!/usr/bin/env nextflow

workflow {
    SAY_HELLO()
    SAY_HELLO.out.view()
}

process SAY_HELLO {
    output:
    stdout  // Declares that the output will be sent to standard output
    script:
    """
    echo "Hello world"
    """
}
