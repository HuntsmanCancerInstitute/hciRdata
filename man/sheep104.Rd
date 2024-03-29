% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{sheep104}
\alias{sheep104}
\title{Sheep gene annotations from Ensembl release 104}
\format{
A tibble with 9 columns: id, gene_name, biotype, chromosome,
start, end, strand, description, transcripts
}
\source{
\code{read_biomart("sheep", version = 104)}.
}
\usage{
sheep104
}
\description{
Sheep gene annotations from Ensembl release 104
}
\examples{
sheep104
group_by(sheep104, biotype) \%>\% summarize(n=n()) \%>\% arrange(desc(n))
}
\keyword{datasets}
