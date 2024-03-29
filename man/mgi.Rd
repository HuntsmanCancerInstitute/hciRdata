% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{mgi}
\alias{mgi}
\title{Mouse and human homologs from MGI 6.16}
\format{
A tibble with 4 columns:
\describe{
  \item{id}{ MGI ID }
  \item{mouse}{ Mouse gene symbol }
  \item{n}{ Number of human homologs}
  \item{human}{ Human gene symbol, comma-separated if more than two }
}
}
\source{
\url{http://www.informatics.jax.org/downloads/reports/HMD_HumanPhenotype.rpt}.
See the \code{data-raw} directory for code to download and group by mouse gene.
}
\usage{
mgi
}
\description{
Mouse and human homologs from MGI 6.16
}
\examples{
mgi
}
\keyword{datasets}
