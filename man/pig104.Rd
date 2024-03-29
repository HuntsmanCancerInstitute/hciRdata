% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{pig104}
\alias{pig104}
\title{Pig gene annotations from Ensembl release 104}
\format{
A tibble with 9 columns: id, gene_name, biotype, chromosome,
start, end, strand, description, transcripts
}
\source{
\code{read_biomart("pig", version = 104)}
}
\usage{
pig104
}
\description{
Pig gene annotations from Ensembl release 104
}
\examples{
pig104
group_by(pig104, biotype) \%>\% summarize(n=n()) \%>\% arrange(desc(n))
}
\keyword{datasets}
