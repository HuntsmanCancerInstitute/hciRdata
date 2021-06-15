#' Human gene annotations from Ensembl release 104
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("human", version = 104)}
#' @examples
#' human104
#' attr(human104, "downloaded")
#' group_by(human104, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"human104"

#' Mouse gene annotations from Ensembl release 104
#'
#' @format A tibble with 10 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts, human_homolog from MGI 6.14.
#' @source \code{read_biomart("mouse", version = 104)}.
#'  the \code{mouse.R} file in the \code{data-raw} directory for details.
#' @examples
#' mouse104
#' filter(mouse104[, c(1:4,10)], grepl(",", human_homolog))
#' group_by(mouse104, biotype) %>%
#'  summarize(n=n(), human_homologs = sum(!is.na(human_homolog))) %>%
#'   arrange(desc(n))
"mouse104"

#' Fruitfly gene annotations from Ensembl release 104
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("fly", version = 104)}
#' @examples
#' fly104
#' group_by(fly104, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"fly104"

#' Rat gene annotations from Ensembl release 104
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("rat", version = 104)}
#' @examples
#' rat104
#' group_by(rat104, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"rat104"

#' Pig gene annotations from Ensembl release 104
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("pig", version = 104)}
#' @examples
#' pig104
#' group_by(pig104, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"pig104"

#' Sheep gene annotations from Ensembl release 104
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("sheep", version = 104)}.
#' @examples
#' sheep104
#' group_by(sheep104, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"sheep104"

#' Rabbit gene annotations from Ensembl release 104
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("rabbit", version = 104)}
#' @examples
#' rabbit104
#' group_by(rabbit104, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"rabbit104"

#' Vervet gene annotations from Ensembl release 104
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("vervet", version = 104)}
#' @examples
#' vervet104
"vervet104"

#' Roundworm (C. elegans) gene annotations from Ensembl release 104
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("roundworm", version = 104)}
#' @examples
#' worm104
#' group_by(worm104, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"worm104"

#' Zebrafish gene annotations from Ensembl release 104
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("zebrafish", version = 104)}
#' @examples
#' zebrafish104
#' group_by(zebrafish104, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"zebrafish104"

#' Yeast (S. cerevisiae) gene annotations from Ensembl release 104
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("yeast", version = 104)}. Gene names have been replaced
# with names from SGD.
#' @examples
#' yeast104
#' group_by(yeast104, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"yeast104"

#' Elephant gene annotations from Ensembl release 104
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("yeast", version = 104)}
#' @examples
#' elephant104
#' group_by(elephant104, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"elephant104"

#' Mouse and human homologs from MGI 6.16
#'
#' @format A tibble with 4 columns:
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

#' Human gene synonyms from HUGO downloaded on Dec 14, 2020
#'
#' @format A tibble with 3 columns: name, synonym, source column
#'
#' @source \url{https://www.genenames.org/}
#' @examples
#' hugo
#' table(hugo$source)
"hugo"

#' Hallmark gene sets in MSigDB 7.2.
#'
#' @format A list with 50 gene sets.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' length(msig_hallmark)
#' msig_hallmark[1:3]
"msig_hallmark"

#' C2 pathways in the MSigDB 7.2.
#'
#' @format A list of 10 pathway databases.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' sapply(msig_pathways, length)
#' msig_pathways$KEGG[1:3]
"msig_pathways"

#' C3 motifs in the MSigDB 7.2.
#'
#' @format A list of 2 lists including transcription factor and miRNA targets.
#' See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' sapply(msig_motifs, length)
#' msig_motifs$MIR[1:3]
"msig_motifs"

#' C4 cancer sets in the MSigDB 7.2.
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

#' C5 Gene Ontology sets in the MSigDB 7.2.
#'
#' @format A list of 3 ontologies with BP, MF, and CC.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' sapply(msig_go, length)
#' msig_go$BP[1:3]
"msig_go"

#' C6 oncogenic signatures in the MSigDB 7.2.
#'
#' @format A list with oncogenic signatures.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' length(msig_oncogenic)
#' msig_oncogenic[1:3]
"msig_oncogenic"

#' C7 immunologic signatures in the MSigDB 7.2.
#'
#' @format A list with immunologic signatures.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' length(msig_immunologic)
#' msig_immunologic[1:3]
"msig_immunologic"
