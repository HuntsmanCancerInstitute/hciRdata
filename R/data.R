#' Human gene annotations from Ensembl release 102
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("human", version = 102)}
#' @examples
#' human102
#' attr(human102, "downloaded")
#' group_by(human102, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"human102"

#' Mouse gene annotations from Ensembl release 102
#'
#' @format A tibble with 10 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts, human_homolog from MGI 6.14.
#' @source \code{read_biomart("mouse", version = 102)}.
#'  the \code{mouse.R} file in the \code{data-raw} directory for details.
#' @examples
#' mouse102
#' filter(mouse102[, c(1:4,10)], grepl(",", human_homolog))
#' group_by(mouse102, biotype) %>%
#'  summarize(n=n(), human_homologs = sum(!is.na(human_homolog))) %>%
#'   arrange(desc(n))
"mouse102"

#' Fruitfly gene annotations from Ensembl release 102
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("fly", version = 102)}
#' @examples
#' fly102
#' group_by(fly102, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"fly102"

#' Rat gene annotations from Ensembl release 102
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("rat", version = 102)}
#' @examples
#' rat102
#' group_by(rat102, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"rat102"

#' Pig gene annotations from Ensembl release 102
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("pig", version = 102)}
#' @examples
#' pig102
#' group_by(pig102, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"pig102"

#' Sheep gene annotations from Ensembl release 102
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("sheep", version = 102)}.
#' @examples
#' sheep102
#' group_by(sheep102, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"sheep102"

#' Rabbit gene annotations from Ensembl release 102
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("rabbit", version = 102)}
#' @examples
#' rabbit102
#' group_by(rabbit102, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"rabbit102"

#' Vervet gene annotations from Ensembl release 102
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("vervet", version = 102)}
#' @examples
#' vervet102
"vervet102"

#' Roundworm (C. elegans) gene annotations from Ensembl release 102
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("roundworm", version = 102)}
#' @examples
#' worm102
#' group_by(worm102, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"worm102"

#' Zebrafish gene annotations from Ensembl release 102
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("zebrafish", version = 102)}
#' @examples
#' zebrafish102
#' group_by(zebrafish102, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"zebrafish102"

#' Yeast (S. cerevisiae) gene annotations from Ensembl release 102
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("yeast", version = 102)}. Gene names have been replaced
# with names from SGD.
#' @examples
#' yeast102
#' group_by(yeast102, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"yeast102"

#' Elephant gene annotations from Ensembl release 102
#'
#' @format A tibble with 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart("yeast", version = 102)}
#' @examples
#' elephant102
#' group_by(elephant102, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"elephant102"

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
