% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{human112}
\alias{human112}
\title{Human gene annotations from Ensembl release 112}
\format{
A tibble with 9 columns: id, gene_name, biotype, chromosome,
start, end, strand, description, transcripts
}
\source{
\code{read_biomart("human", version = 112)}
}
\usage{
human112
}
\description{
Human gene annotations from Ensembl release 112
}
\examples{
human112
attr(human112, "downloaded")
group_by(human112, biotype) \%>\% summarize(n=n()) \%>\% arrange(desc(n))
}
\keyword{datasets}
