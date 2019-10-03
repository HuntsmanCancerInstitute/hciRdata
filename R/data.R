#' Human gene annotations from Ensembl release 98
#'
#' @format A tibble with 60,623 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("human", version = 98)}
#' @examples
#' human98
#' attr(human98, "downloaded")
#' group_by(human98, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"human98"

#' Mouse gene annotations from Ensembl release 98
#'
#' @format A tibble with 55,421 rows and 10 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts, human_homolog from MGI 6.14.
#' @source \code{read_biomart("mouse", version = 98)}.
#'  the \code{mouse.R} file in the \code{data-raw} directory for details.
#' @examples
#' mouse98
#' filter(mouse98[, c(1:4,10)], grepl(",", human_homolog))
#' group_by(mouse98, biotype) %>%
#'  summarize(n=n(), human_homologs = sum(!is.na(human_homolog))) %>%
#'   arrange(desc(n))
"mouse98"

#' Fruitfly gene annotations from Ensembl release 98
#'
#' @format A tibble with 17,753 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("fly", version = 98)}
#' @examples
#' fly98
#' group_by(fly98, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"fly98"

#' Rat gene annotations from Ensembl release 98
#'
#' @format A tibble with 32,883 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("rat", version = 98)}
#' @examples
#' rat98
#' group_by(rat98, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"rat98"

#' Pig gene annotations from Ensembl release 98
#'
#' @format A tibble with 31,907 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("pig", version = 98)}
#' @examples
#' pig98
#' group_by(pig98, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"pig98"

#' Sheep gene annotations from Ensembl release 98
#'
#' @format A tibble with 27,054 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("sheep", version = 98)}
#' @examples
#' sheep98
#' group_by(sheep98, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"sheep98"

#' Rabbit gene annotations from Ensembl release 98
#'
#' @format A tibble with 29,587 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("rabbit", version = 98)}
#' @examples
#' rabbit98
#' group_by(rabbit98, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"rabbit98"

#' Vervet gene annotations from Ensembl release 98
#'
#' @format A tibble with 27,985 rows and 10 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts, and human_homolog with maximum percent
#' identity from Ensembl
#' @source \code{read_biomart("vervet", version = 98)}
#' @examples
#' vervet98
"vervet98"

#' Roundworm (C. elegans) gene annotations from Ensembl release 98
#'
#' @format A tibble with 46,904 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("roundworm", version = 98)}
#' @examples
#' worm98
#' group_by(worm98, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"worm98"

#' Zebrafish gene annotations from Ensembl release 98
#'
#' @format A tibble with 35,117 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("zebrafish", version = 98)}
#' @examples
#' zebrafish98
#' group_by(zebrafish98, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"zebrafish98"

#' Yeast (S. cerevisiae) gene annotations from Ensembl release 98
#'
#' @format A tibble with 7,127 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("yeast", version = 98)}
#' @examples
#' yeast98
#' group_by(yeast98, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"yeast98"

#' Elephant gene annotations from Ensembl release 98
#'
#' @format A tibble with 23,245 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("yeast", version = 98)}
#' @examples
#' elephant98
#' group_by(elephant98, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"elephant98"

#' Mouse and human homologs from MGI 6.14
#'
#' @format A tibble with 18,479 rows and 4 variables:
#' \describe{
#'   \item{id}{ MGI ID }
#'   \item{mouse}{ Mouse gene symbol }
#'   \item{n}{ Number of human homologs}
#'   \item{human}{ Human gene symbol, comma-separated if more than two }
#' }
#' @source \url{http://www.informatics.jax.org/downloads/reports/HMD_HumanPhenotype.rpt}.
#' See the \code{data-raw} directory for code to download and group by mouse gene.
#' @examples
#' mgi
"mgi"

#' Human gene synonyms from HUGO downloaded on Oct 3, 2019
#'
#' @format A tibble with 42,793 rows and 3 columns: name, synonym, source column
#'
#' @source \url{https://www.genenames.org/}
#' @examples
#' hugo
#' table(hugo$source)
"hugo"

#' Hallmark gene sets in MSigDB 7.0.
#'
#' @format A list with 50 gene sets.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' length(msig_hallmark)
#' msig_hallmark[1:3]
"msig_hallmark"

#' C2 pathways in the MSigDB 7.0.
#'
#' @format A list of 9 lists.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' sapply(msig_pathways, length)
#' msig_pathways$KEGG[1:3]
"msig_pathways"

#' C3 motifs in the MSigDB 7.0.
#'
#' @format A list of 2 lists including transcription factor and miRNA targets.
#' See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' sapply(msig_motifs, length)
#' msig_motifs$MIR[1:3]
"msig_motifs"

#' C4 cancer sets in the MSigDB 7.0.
#'
#' @format A list of 5 lists including CAR (Novartis carcinoma compendium),
#' GCM (Global Cancer Map), GNF2 (Human tissue compendium),  MODULE (Gene sets from Segal 2004),
#' and MORF (unpublished compendium).  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' sapply(msig_cancer, length)
#' msig_cancer$CAR[1:3]
"msig_cancer"

#' C5 Gene Ontology sets in the MSigDB 7.0.
#'
#' @format A list of 3 lists with BP, MF, and CC.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' sapply(msig_go, length)
#' msig_go$BP[1:3]
"msig_go"

#' C6 oncogenic signatures in the MSigDB 7.0.
#'
#' @format A list with 189 gene sets.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' length(msig_oncogenic)
#' msig_oncogenic[1:3]
"msig_oncogenic"

#' C7 immunologic signatures in the MSigDB 7.0.
#'
#' @format A list with 4872 gene sets.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' length(msig_immunologic)
#' msig_immunologic[1:3]
"msig_immunologic"
