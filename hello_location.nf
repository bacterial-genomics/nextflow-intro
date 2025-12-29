#!/usr/bin/env nextflow

params.location = null

workflow {
    location_ch = Channel.of(params.location)
    SAY_HELLO(location_ch)
    SAY_HELLO.out.view()
}

process SAY_HELLO {
    input:
    val location

    output:
    stdout  // Declares that the output will be sent to standard output

    script:
    """
    echo "Hello ${location ?: 'World'}"
    """
}
