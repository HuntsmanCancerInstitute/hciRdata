% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{worm104}
\alias{worm104}
\title{Roundworm (C. elegans) gene annotations from Ensembl release 104}
\format{
A tibble with 9 columns: id, gene_name, biotype, chromosome,
start, end, strand, description, transcripts
}
\source{
\code{read_biomart("roundworm", version = 104)}
}
\usage{
worm104
}
\description{
Roundworm (C. elegans) gene annotations from Ensembl release 104
}
\examples{
worm104
group_by(worm104, biotype) \%>\% summarize(n=n()) \%>\% arrange(desc(n))
}
\keyword{datasets}
