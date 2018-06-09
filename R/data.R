#' Mouse and human homologs from MGI
#'
#' @format A tibble with 18,117 rows and 4 variables:
#' \describe{
#'   \item{id}{ MGI ID }
#'   \item{mouse}{ Mouse gene symbol }
#'   \item{n}{ Number of human homologs}
#'   \item{human}{ Human gene symbol, comma-separated if more than two }
#' }
#' @source \url{http://www.informatics.jax.org/downloads/reports/HMD_HumanPhenotype.rpt}.
#' See the \code{data-raw} directory for code to download and group by mouse gene.
#' @examples
#' data(mgi)
#' mgi
#' filter(mgi, n>1)                     # 2 or more homologs
#' prop.table(table( mgi$human == toupper(mgi$mouse))) # 87% are the same
#' data(mouse92)                     # 127 missing in Ensembl version 92
#' filter(mgi, !mouse %in% mouse92$gene_name)
#' attr(mgi, "downloaded")
#' attr(mgi, "version")
"mgi"

#' Mouse and human homologs from Ensembl release 92
#'
#' @format A tibble with 24,670 rows and 5 columns: id,mouse, perc_id, n, human
#' @source \code{read_biomart}. See \code{data_raw/ensembl.R} for details.
#' @examples
#' data(mouse92_homologs)
#' mouse92_homologs
#' filter(mouse92_homologs, !mouse %in% mgi$mouse)
"mouse92_homologs"

#' Human gene annotations from Ensembl release 90
#'
#' @format A tibble with 63,967 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("human", version = 90)}
#' @examples
#' data(human90)
#' human90
#' attr(human90, "downloaded")
#' group_by(human90, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"human90"

#' Mouse gene annotations from Ensembl release 90
#'
#' @format A tibble with 53,110 rows and 10 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts, human_homolog from MGI.
#' @source \code{read_biomart_version("mouse", version = 90)}.
#'  the \code{mouse.R} file in the \code{data-raw} directory for details.
#' @examples
#' data(mouse90)
#' mouse90
#' filter(mouse90[, c(1:4,10)], grepl(",", human_homolog))
#' group_by(mouse90, biotype) %>%
#'  summarize(n=n(), human_homologs = sum(!is.na(human_homolog))) %>%
#'   arrange(desc(n))
"mouse90"

#' Fruitfly gene annotations from Ensembl release 90
#'
#' @format A tibble with 17,559 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("fly", version = 90)}
#' @examples
#' data(fly90)
#' fly90
#' group_by(fly90, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"fly90"

#' Rat gene annotations from Ensembl release 90
#'
#' @format A tibble with 32,883 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("rat", version = 90)}
#' @examples
#' data(rat90)
#' rat90
#' group_by(rat90, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"rat90"

#' Pig gene annotations from Ensembl release 90
#'
#' @format A tibble with 25,880 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("pig", version = 90)}
#' @examples
#' data(pig90)
#' pig90
#' group_by(pig90, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"pig90"

#' Sheep gene annotations from Ensembl release 90
#'
#' @format A tibble with 27,054 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("sheep", version = 90)}
#' @examples
#' data(sheep90)
#' sheep90
#' group_by(sheep90, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"sheep90"

#' Rabbit gene annotations from Ensembl release 90
#'
#' @format A tibble with 23,669 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("rabbit", version = 90)}
#' @examples
#' data(rabbit90)
#' rabbit90
#' group_by(rabbit90, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"rabbit90"

#' Zebrafish gene annotations from Ensembl release 90
#'
#' @format A tibble with 35,117 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("zebrafish", version = 90)}
#' @examples
#' data(zebrafish90)
#' zebrafish90
#' group_by(zebrafish90, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"zebrafish90"

#' Roundworm (C. elegans) gene annotations from Ensembl release 90
#'
#' @format A tibble with 46,739 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("roundworm", version = 90)}
#' @examples
#' data(worm90)
#' worm90
#' group_by(worm90, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"worm90"

#' Yeast (S. cerevisiae) gene annotations from Ensembl release 90
#'
#' @format A tibble with 7,126 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("yeast", version = 90)}
#' @examples
#' data(yeast90)
#' yeast90
#' group_by(yeast90, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"yeast90"

#' Human gene annotations from Ensembl release 92
#'
#' @format A tibble with 64,561 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("human", version = 92)}
#' @examples
#' data(human92)
#' human92
#' attr(human92, "downloaded")
#' data(human90)
#' inner_join( group_by(human90, biotype) %>% summarize(n90=n()),
#'             group_by(human92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n90) %>%  arrange(desc(n92))
"human92"

#' Mouse gene annotations from Ensembl release 92
#'
#' @format A tibble with 54,590 rows and 10 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts, human_homolog from MGI.
#' @source \code{read_biomart_version("mouse", version = 92)}.
#'  the \code{mouse.R} file in the \code{data-raw} directory for details.
#' @examples
#' data(mouse92)
#' mouse92
#' filter(mouse92[, c(1:4,10)], grepl(",", human_homolog))
#' data(mouse90)
#' inner_join( group_by(mouse90, biotype) %>% summarize(n90=n()),
#'             group_by(mouse92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n90) %>%  arrange(desc(n92))
"mouse92"

#' Fruitfly gene annotations from Ensembl release 92
#'
#' @format A tibble with 17,737 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("fly", version = 92)}
#' @examples
#' data(fly92)
#' fly92
#' data(fly90)
#' inner_join( group_by(fly90, biotype) %>% summarize(n90=n()),
#'             group_by(fly92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n90) %>%  arrange(desc(n92))
"fly92"

#' Rat gene annotations from Ensembl release 92
#'
#' @format A tibble with 32,883 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("rat", version = 92)}
#' @examples
#' data(rat92)
#' rat92
#' data(rat90)
#' inner_join( group_by(rat90, biotype) %>% summarize(n90=n()),
#'             group_by(rat92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n90) %>%  arrange(desc(n92))
"rat92"

#' Pig gene annotations from Ensembl release 92
#'
#' @format A tibble with 25,880 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("pig", version = 92)}
#' @examples
#' data(pig92)
#' pig92
#' data(pig90)
#' inner_join( group_by(pig90, biotype) %>% summarize(n90=n()),
#'             group_by(pig92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n90) %>%  arrange(desc(n92))
"pig92"

#' Sheep gene annotations from Ensembl release 92
#'
#' @format A tibble with 27,054 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("sheep", version = 92)}
#' @examples
#' data(sheep92)
#' sheep92
#' data(sheep90)
#' inner_join( group_by(sheep90, biotype) %>% summarize(n90=n()),
#'             group_by(sheep92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n90) %>%  arrange(desc(n92))
"sheep92"

#' Rabbit gene annotations from Ensembl release 92
#'
#' @format A tibble with 23,669 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("rabbit", version = 92)}
#' @examples
#' data(rabbit92)
#' rabbit92
#' data(rabbit90)
#' inner_join( group_by(rabbit90, biotype) %>% summarize(n90=n()),
#'             group_by(rabbit92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n90) %>%  arrange(desc(n92))
"rabbit92"

#' Zebrafish gene annotations from Ensembl release 92
#'
#' @format A tibble with 36,622 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("zebrafish", version = 92)}
#' @examples
#' data(zebrafish92)
#' zebrafish92
#' data(zebrafish90)
#' inner_join( group_by(zebrafish90, biotype) %>% summarize(n90=n()),
#'             group_by(zebrafish92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n90) %>%  arrange(desc(n92))
"zebrafish92"

#' Roundworm (C. elegans) gene annotations from Ensembl release 92
#'
#' @format A tibble with 46,778 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("roundworm", version = 92)}
#' @examples
#' data(worm92)
#' worm92
#' data(worm90)
#' inner_join( group_by(worm90, biotype) %>% summarize(n90=n()),
#'             group_by(worm92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n90) %>%  arrange(desc(n92))
"worm92"

#' Yeast (S. cerevisiae) gene annotations from Ensembl release 92
#'
#' @format A tibble with 7,126 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("yeast", version = 92)}
#' @examples
#' data(yeast92)
#' yeast92
#' data(yeast90)
#' inner_join( group_by(yeast90, biotype) %>% summarize(n90=n()),
#'             group_by(yeast92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n90) %>%  arrange(desc(n92))
"yeast92"


#' Human gene synonyms from HUGO
#'
#' @format A tibble with 42,216 rows and 3 columns: name, synonym, source column
#'
#' @source \url{https://www.genenames.org/}
#' @examples
#' data(hugo)
#' hugo
#' table(hugo$source)
"hugo"

#' Hallmark gene sets in MSigDB.
#'
#' @format A list with 50 gene sets.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' data(msig_hallmark)
#' length(msig_hallmark)
#' msig_hallmark[1:3]
"msig_hallmark"

#' C2 pathways in the MSigDB.
#'
#' @format A list of 9 lists.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' data(msig_pathways)
#' sapply(msig_pathways, length)
#' msig_pathways$KEGG[1:3]
"msig_pathways"

#' C3 motifs in the MSigDB.
#'
#' @format A list of 2 lists including transcription factor and miRNA targets.
#' See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' data(msig_motifs)
#' sapply(msig_motifs, length)
#' msig_motifs$MIR[1:3]
"msig_motifs"

#' C4 cancer sets in the MSigDB.
#'
#' @format A list of 5 lists including CAR (Novartis carcinoma compendium),
#' GCM (Global Cancer Map), GNF2 (Human tissue compendium),  MODULE (Gene sets from Segal 2004),
#' and MORF (unpublished compendium).  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' data(msig_cancer)
#' sapply(msig_cancer, length)
#' msig_cancer$CAR[1:3]
"msig_cancer"

#' C5 Gene Ontology sets in the MSigDB.
#'
#' @format A list of 3 lists with BP, MF, and CC.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' data(msig_go)
#' sapply(msig_go, length)
#' msig_go$BP[1:3]
"msig_go"

#' C6 oncogenic signatures in the MSigDB.
#'
#' @format A list with 189 gene sets.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' data(msig_oncogenic)
#' length(msig_oncogenic)
#' msig_oncogenic[1:3]
"msig_oncogenic"

#' C7 immunologic signatures in the MSigDB.
#'
#' @format A list with 4872 gene sets.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' data(msig_immunologic)
#' length(msig_immunologic)
#' msig_immunologic[1:3]
"msig_immunologic"
