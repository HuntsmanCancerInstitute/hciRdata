% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{zebrafish104}
\alias{zebrafish104}
\title{Zebrafish gene annotations from Ensembl release 104}
\format{
A tibble with 9 columns: id, gene_name, biotype, chromosome,
start, end, strand, description, transcripts
}
\source{
\code{read_biomart("zebrafish", version = 104)}
}
\usage{
zebrafish104
}
\description{
Zebrafish gene annotations from Ensembl release 104
}
\examples{
zebrafish104
group_by(zebrafish104, biotype) \%>\% summarize(n=n()) \%>\% arrange(desc(n))
}
\keyword{datasets}
