#' Human gene annotations from Ensembl release 96
#'
#' @format A tibble with 58,884 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("human", version = 96)}
#' @examples
#' human96
#' attr(human96, "downloaded")
#' group_by(human96, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"human96"

#' Mouse gene annotations from Ensembl release 96
#'
#' @format A tibble with 55,536 rows and 10 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts, human_homolog from MGI 6.13.
#' @source \code{read_biomart_version("mouse", version = 96)}.
#'  the \code{mouse.R} file in the \code{data-raw} directory for details.
#' @examples
#' mouse96
#' filter(mouse96[, c(1:4,10)], grepl(",", human_homolog))
#' group_by(mouse96, biotype) %>%
#'  summarize(n=n(), human_homologs = sum(!is.na(human_homolog))) %>%
#'   arrange(desc(n))
"mouse96"

#' Fruitfly gene annotations from Ensembl release 96
#'
#' @format A tibble with 17,753 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("fly", version = 96)}
#' @examples
#' fly96
#' group_by(fly96, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"fly96"

#' Rat gene annotations from Ensembl release 96
#'
#' @format A tibble with 32,883 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("rat", version = 96)}
#' @examples
#' rat96
#' group_by(rat96, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"rat96"

#' Pig gene annotations from Ensembl release 96
#'
#' @format A tibble with 25,880 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("pig", version = 96)}
#' @examples
#' pig96
#' group_by(pig96, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"pig96"

#' Sheep gene annotations from Ensembl release 96
#'
#' @format A tibble with 27,054 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("sheep", version = 96)}
#' @examples
#' sheep96
#' group_by(sheep96, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"sheep96"

#' Rabbit gene annotations from Ensembl release 96
#'
#' @format A tibble with 23,669 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("rabbit", version = 96)}
#' @examples
#' rabbit96
#' group_by(rabbit96, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"rabbit96"

#' Vervet gene annotations from Ensembl release 96
#'
#' @format A tibble with 27,985 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("vervet", version = 96)}
#' @examples
#' vervet96
"vervet96"

#' Zebrafish gene annotations from Ensembl release 96
#'
#' @format A tibble with 32,520 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("zebrafish", version = 96)}
#' @examples
#' zebrafish96
#' group_by(zebrafish96, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"zebrafish96"

#' Roundworm (C. elegans) gene annotations from Ensembl release 96
#'
#' @format A tibble with 46,778 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("roundworm", version = 96)}
#' @examples
#' worm96
#' group_by(worm96, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"worm96"

#' Yeast (S. cerevisiae) gene annotations from Ensembl release 96
#'
#' @format A tibble with 7,036 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("yeast", version = 96)}
#' @examples
#' yeast96
#' group_by(yeast96, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"yeast96"

#' Elephant gene annotations from Ensembl release 96
#'
#' @format A tibble with 23,245 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("yeast", version = 96)}
#' @examples
#' elephant96
#' group_by(elephant96, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"elephant96"

#' Mouse and human homologs from MGI 6.12
#'
#' @format A tibble with 18,473 rows and 4 variables:
#' \describe{
#'   \item{id}{ MGI ID }
#'   \item{mouse}{ Mouse gene symbol }
#'   \item{n}{ Number of human homologs}
#'   \item{human}{ Human gene symbol, comma-separated if more than two }
#' }
#' @source \url{http://www.informatics.jax.org/downloads/reports/HMD_HumanPhenotype.rpt}.
#' See the \code{data-raw} directory for code to download and group by mouse gene.
#' @examples
#' mgi_6.13
"mgi_6.13"

#' Mouse and human homologs from MGI 6.12
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
#' mgi_6.12
#' filter(mgi_6.12, n>1)                     # 2 or more homologs
#' prop.table(table( mgi_6.12$human == toupper(mgi_6.12$mouse))) # 87% are the same
#' # 127 missing in Ensembl version 92
#' filter(mgi_6.12, !mouse %in% mouse92$gene_name)
#' attr(mgi_6.12, "downloaded")
"mgi_6.12"

#' Human gene annotations from Ensembl release 94
#'
#' @format A tibble with 58,302 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("human", version = 94)}
#' @examples
#' human94
#' attr(human94, "downloaded")
#' group_by(human94, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"human94"

#' Mouse gene annotations from Ensembl release 94
#'
#' @format A tibble with 52,636 rows and 10 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts, human_homolog from MGI.
#' @source \code{read_biomart_version("mouse", version = 94)}.
#'  the \code{mouse.R} file in the \code{data-raw} directory for details.
#' @examples
#' mouse94
#' filter(mouse94[, c(1:4,10)], grepl(",", human_homolog))
#' group_by(mouse94, biotype) %>%
#'  summarize(n=n(), human_homologs = sum(!is.na(human_homolog))) %>%
#'   arrange(desc(n))
"mouse94"

#' Fruitfly gene annotations from Ensembl release 94
#'
#' @format A tibble with 17,559 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("fly", version = 94)}
#' @examples
#' fly94
#' group_by(fly94, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"fly94"

#' Rat gene annotations from Ensembl release 94
#'
#' @format A tibble with 32,883 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("rat", version = 94)}
#' @examples
#' rat94
#' group_by(rat94, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"rat94"

#' Pig gene annotations from Ensembl release 94
#'
#' @format A tibble with 25,880 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("pig", version = 94)}
#' @examples
#' pig94
#' group_by(pig94, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"pig94"

#' Sheep gene annotations from Ensembl release 94
#'
#' @format A tibble with 27,054 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("sheep", version = 94)}
#' @examples
#' sheep94
#' group_by(sheep94, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"sheep94"

#' Rabbit gene annotations from Ensembl release 94
#'
#' @format A tibble with 23,669 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("rabbit", version = 94)}
#' @examples
#' rabbit94
#' group_by(rabbit94, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"rabbit94"

#' Vervet gene annotations from Ensembl release 94
#'
#' @format A tibble with 27,985 rows and 10 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts, and human_homolog with maximum percent
#' identity from Ensembl
#' @source \code{read_biomart_version("vervet", version = 94)}
#' @examples
#' vervet94
"vervet94"

#' Zebrafish gene annotations from Ensembl release 94
#'
#' @format A tibble with 35,117 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("zebrafish", version = 94)}
#' @examples
#' zebrafish94
#' group_by(zebrafish94, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"zebrafish94"

#' Roundworm (C. elegans) gene annotations from Ensembl release 94
#'
#' @format A tibble with 46,739 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("roundworm", version = 94)}
#' @examples
#' worm94
#' group_by(worm94, biotype) %>% summarize(n=n()) %>% arrange(desc(n))
"worm94"


#' Human gene annotations from Ensembl release 92
#'
#' @format A tibble with 58,395 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("human", version = 92)}
#' @examples
#' human92
#' attr(human92, "downloaded")
#' inner_join( group_by(human94, biotype) %>% summarize(n94=n()),
#'             group_by(human92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n94) %>%  arrange(desc(n92))
"human92"

#' Mouse gene annotations from Ensembl release 92
#'
#' @format A tibble with 53,801 rows and 10 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts, human_homolog from MGI.
#' @source \code{read_biomart_version("mouse", version = 92)}.
#'  the \code{mouse.R} file in the \code{data-raw} directory for details.
#' @examples
#' mouse92
#' filter(mouse92[, c(1:4,10)], grepl(",", human_homolog))
#' inner_join( group_by(mouse94, biotype) %>% summarize(n94=n()),
#'             group_by(mouse92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n94) %>%  arrange(desc(n92))
"mouse92"

#' Fruitfly gene annotations from Ensembl release 92
#'
#' @format A tibble with 17,737 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("fly", version = 92)}
#' @examples
#' fly92
#' inner_join( group_by(fly94, biotype) %>% summarize(n94=n()),
#'             group_by(fly92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n94) %>%  arrange(desc(n92))
"fly92"

#' Rat gene annotations from Ensembl release 92
#'
#' @format A tibble with 32,883 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("rat", version = 92)}
#' @examples
#' rat92
#' inner_join( group_by(rat94, biotype) %>% summarize(n94=n()),
#'             group_by(rat92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n94) %>%  arrange(desc(n92))
"rat92"

#' Pig gene annotations from Ensembl release 92
#'
#' @format A tibble with 25,880 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("pig", version = 92)}
#' @examples
#' pig92
#' inner_join( group_by(pig94, biotype) %>% summarize(n94=n()),
#'             group_by(pig92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n94) %>%  arrange(desc(n92))
"pig92"

#' Sheep gene annotations from Ensembl release 92
#'
#' @format A tibble with 27,054 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("sheep", version = 92)}
#' @examples
#' sheep92
#' inner_join( group_by(sheep94, biotype) %>% summarize(n94=n()),
#'             group_by(sheep92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n94) %>%  arrange(desc(n92))
"sheep92"

#' Rabbit gene annotations from Ensembl release 92
#'
#' @format A tibble with 23,669 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("rabbit", version = 92)}
#' @examples
#' rabbit92
#' inner_join( group_by(rabbit94, biotype) %>% summarize(n94=n()),
#'             group_by(rabbit92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n94) %>%  arrange(desc(n92))
"rabbit92"




#' Zebrafish gene annotations from Ensembl release 92
#'
#' @format A tibble with 36,622 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("zebrafish", version = 92)}
#' @examples
#' zebrafish92
#' inner_join( group_by(zebrafish94, biotype) %>% summarize(n94=n()),
#'             group_by(zebrafish92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n94) %>%  arrange(desc(n92))
"zebrafish92"

#' Roundworm (C. elegans) gene annotations from Ensembl release 92
#'
#' @format A tibble with 46,778 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("roundworm", version = 92)}
#' @examples
#' worm92
#' inner_join( group_by(worm94, biotype) %>% summarize(n94=n()),
#'             group_by(worm92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n94) %>%  arrange(desc(n92))
"worm92"

#' Yeast (S. cerevisiae) gene annotations from Ensembl release 92
#'
#' @format A tibble with 7,126 rows and 9 columns: id, gene_name, biotype, chromosome,
#' start, end, strand, description, transcripts
#' @source \code{read_biomart_version("yeast", version = 92)}
#' @examples
#' yeast92
#' inner_join( group_by(yeast94, biotype) %>% summarize(n94=n()),
#'             group_by(yeast92, biotype) %>% summarize(n92=n())) %>%
#'             mutate(diff = n92 - n94) %>%  arrange(desc(n92))
"yeast92"


#' Human gene synonyms from HUGO
#'
#' @format A tibble with 42,216 rows and 3 columns: name, synonym, source column
#'
#' @source \url{https://www.genenames.org/}
#' @examples
#' hugo
#' table(hugo$source)
"hugo"

#' Hallmark gene sets in MSigDB.
#'
#' @format A list with 50 gene sets.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' length(msig_hallmark)
#' msig_hallmark[1:3]
"msig_hallmark"

#' C2 pathways in the MSigDB.
#'
#' @format A list of 9 lists.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
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
#' sapply(msig_cancer, length)
#' msig_cancer$CAR[1:3]
"msig_cancer"

#' C5 Gene Ontology sets in the MSigDB.
#'
#' @format A list of 3 lists with BP, MF, and CC.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' sapply(msig_go, length)
#' msig_go$BP[1:3]
"msig_go"

#' C6 oncogenic signatures in the MSigDB.
#'
#' @format A list with 189 gene sets.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' length(msig_oncogenic)
#' msig_oncogenic[1:3]
"msig_oncogenic"

#' C7 immunologic signatures in the MSigDB.
#'
#' @format A list with 4872 gene sets.  See \code{data_raw/msigdb.R} for details.
#'
#' @source \url{http://software.broadinstitute.org/gsea/msigdb/collections.jsp}
#' @examples
#' length(msig_immunologic)
#' msig_immunologic[1:3]
"msig_immunologic"
