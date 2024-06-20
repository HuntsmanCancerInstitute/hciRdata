#' Human gene annotations from Ensembl release 112
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("human", version = 112)}
#' @examples
#' human112
#' attr(human112, "downloaded")
#' group_by(human112, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"human112"

#' Mouse gene annotations from Ensembl release 112
#'
#' @format A tibble with 10 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts, human_homolog from MGI 6.14.
#' @source \code{read_biomart("mouse", version = 112)}.
#'  the \code{mouse.R} file in the \code{data-raw} directory for details.
#' @examples
#' mouse112
#' filter(mouse112[, c(1:4,10)], grepl(",", human_homolog))
#' group_by(mouse112, biotype) %>%
#'  summarize(n=n(), human_homologs = sum(!is.na(human_homolog))) %>%
#'   arrange(desc(n))
"mouse112"

#' Fruitfly gene annotations from Ensembl release 112
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("fly", version = 112)}
#' @examples
#' fly112
#' group_by(fly112, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"fly112"

#' Rat gene annotations from Ensembl release 112
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("rat", version = 112)}
#' @examples
#' rat112
#' group_by(rat112, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"rat112"

#' Pig gene annotations from Ensembl release 112
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("pig", version = 112)}
#' @examples
#' pig112
#' group_by(pig112, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"pig112"

#' Sheep gene annotations from Ensembl release 112
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("sheep", version = 112)}.
#' @examples
#' sheep112
#' group_by(sheep112, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"sheep112"

#' Rabbit gene annotations from Ensembl release 112
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("rabbit", version = 112)}
#' @examples
#' rabbit112
#' group_by(rabbit112, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"rabbit112"

#' Vervet gene annotations from Ensembl release 112
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("vervet", version = 112)}
#' @examples
#' vervet112
"vervet112"

#' Roundworm (C. elegans) gene annotations from Ensembl release 112
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("roundworm", version = 112)}
#' @examples
#' worm112
#' group_by(worm112, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"worm112"

#' Zebrafish gene annotations from Ensembl release 112
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("zebrafish", version = 112)}
#' @examples
#' zebrafish112
#' group_by(zebrafish112, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"zebrafish112"

#' Yeast (S. cerevisiae) gene annotations from Ensembl release 112
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("yeast", version = 112)}. Gene names have been replaced
# with names from SGD.
#' @examples
#' yeast112
#' group_by(yeast112, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"yeast112"

#' Elephant gene annotations from Ensembl release 112
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("yeast", version = 112)}
#' @examples
#' elephant112
#' group_by(elephant112, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"elephant112"

#' Mouse and human homologs from MGI 6.23 last updated 05/28/2024
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

#' Human gene synonyms from HUGO downloaded on June 13, 2024
#'
#' @format A tibble with 3 columns: name, synonym, type column
#'
#' @source \url{https://g-a8b222.dd271.03c0.data.globus.org/pub/databases/genenames/hgnc/tsv/non_alt_loci_set.txt}
#' @examples
#' hugo
#' table(hugo$source)
"hugo"

#' Hallmark gene sets in MSigDB v2023.2.
#'
#' @format A list with 50 gene sets.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' length(msig_hallmark)
#' msig_hallmark[1:3]
"msig_hallmark"

#' C2 pathways in the MSigDB v2023.2.
#'
#' @format A list of 9 pathway databases.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' sapply(msig_pathways, length)
#' msig_pathways$KEGG[1:3]
"msig_pathways"

#' C3 motifs in the MSigDB v2023.2.
#'
#' @format A list of 2 lists including transcription factor and miRNA targets.
#' See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' sapply(msig_motifs, length)
#' msig_motifs$MIR[1:3]
"msig_motifs"

#' C4 cancer sets in the MSigDB v2023.2.
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

#' C5 Gene Ontology sets in the MSigDB v2023.2.
#'
#' @format A list of 3 ontologies with BP, MF, and CC.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' sapply(msig_go, length)
#' msig_go$BP[1:3]
"msig_go"

#' C6 oncogenic signatures in the MSigDB v2023.2.
#'
#' @format A list with oncogenic signatures.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' length(msig_oncogenic)
#' msig_oncogenic[1:3]
"msig_oncogenic"

#' C7 immunologic signatures in the MSigDB v2023.2.
#'
#' @format A list with immunologic signatures.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' length(msig_immunologic)
#' msig_immunologic[1:3]
"msig_immunologic"

#' C8 cell type signature gene sets in the MSigDB v2023.2.
#'
#' @format A list with cell type signatures.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' length(msig_celltype)
#' msig_celltype[1:3]
"msig_celltype"
