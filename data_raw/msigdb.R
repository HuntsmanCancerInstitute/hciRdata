# MsigDB 6.1
# downloaded April 20, 2018

# Download from http://software.broadinstitute.org/gsea/msigdb/collections.jsp
# and save to data_raw/msigdb


#------------------------
# H HALLMARK
x1 <- read_msigdb("h.all.v6.2.symbols.gmt")
x1 <- lapply(x1, sort)

x <- unique( unlist(x1))

#133 genes missing from human version 92
y <- sort( x[!x %in% human96$gene_name] )

## 113 with synonym in HUGO (and MLL2 with 2 matches)
z <- filter(hugo, synonym %in% y)
# A tibble: 114 x 3
#   name   synonym source
#   <chr>  <chr>   <chr>
# 1 ACKR1  DARC    Previous symbol
# 2 ACKR3  CXCR7   Previous symbol
# 3 ADGRA2 GPR124  Previous symbol
# 4 ADGRE1 EMR1    Previous symbol

## 11 missing
dropGenes <- y[!y %in% hugo$synonym]

## replace missing gene names in Ensembl with HUGO name and drop 11 missing from both lists (Ensembl and HUGO)
##  LEFT join will replace MLL2 with two names...
msig_hallmark <- lapply(x1, function(x) left_join(tibble(synonym =x) , z, by = "synonym") %>%
    mutate(synonym= ifelse(is.na(name), synonym, name)) %>% filter(!synonym %in% dropGenes ) %>% pull(1)  )

names(msig_hallmark) <- format_msig(names(msig_hallmark))




#------------------------
# C2 Canonical pathways
x2 <- read_msigdb("c2.cp.v6.2.symbols.gmt")

sapply(x2, length)
#BIOCARTA     KEGG     NABA      PID REACTOME       SA      SIG       ST      WNT
#     217      186       10      196      674       10        8       27        1

update_msig_list <- function(x2, format = TRUE){
 for(i in 1:length(x2)){
   x2[[i]] <- lapply(x2[[i]], sort)
   x <- unique( unlist(x2[[i]]))
   y <- sort( x[!x %in% human96$gene_name] )
   z <- filter(hugo, synonym %in% y)
   dropGenes <- y[!y %in% hugo$synonym]
   message(names(x2[i]), ": ", length(y), " genes missing (", length(dropGenes), " without a match)")
   x2[[i]] <- lapply(x2[[i]], function(x) left_join(tibble(synonym =x) , z, by = "synonym") %>%
     mutate(synonym= ifelse(is.na(name), synonym, name))  %>% filter(!synonym %in% dropGenes )  %>% pull(1)  )
   if(format) names(x2[[i]]) <- format_msig( names(x2[[i]]))
 }
 x2
}

msig_pathways <- update_msig_list(x2)



#------------------------
# C3 MOTIFS

# TFT: transcription factor targets
x3a <- read_msigdb("c3.tft.v6.2.symbols.gmt")

## flatten list of lists
# table( sapply(x3, length))
#   1   2   3   4   5   6   7   8  10
# 378  47  11   7   7   2   1   1   2


# MIR: microRNA targets
x3b  <- read_msigdb("c3.mir.v6.2.symbols.gmt")

x3 <- list(TFT = unlist(x3a, recursive=FALSE),
            MIR= unlist(x3b, recursive=FALSE))

msig_motifs <- update_msig_list(x3, format = FALSE)
# TFT: 892 genes missing (148 without a match)
# MIR: 483 genes missing (57 without a match)


#------------------------
#  C4 computational gene sets  (cancer)

x4 <- read_msigdb("c4.all.v6.2.symbols.gmt")
#sapply(x4, length)
#   CAR    GCM   GNF2 MODULE   MORF
#     6     82    146    431    193

# change 1 to MODULE.001
names(x4$MODULE) <- paste0( "MODULE.", stringr::str_pad(names(x4$MODULE), 3, "left", "0"))

# CAR: Novartis carcinoma compendium (Novartis).
# GCM: Global Cancer Map (Broad Institute).
# GNF2: Human tissue compendium (Novartis).
# MODULE: Gene sets defined by Segal et al. 2004.
# MORF: An unpublished compendium of gene expression data sets

msig_cancer <- update_msig_list(x4, format = FALSE)
# CAR: 4 genes missing (0 without a match)
# GCM: 83 genes missing (5 without a match)
# GNF2: 60 genes missing (5 without a match)
# MODULE: 427 genes missing (82 without a match)
# MORF: 115 genes missing (24 without a match)


#------------------------
#  C5 Gene Ontology (GO) gene sets  (need 3 separate files)

bp <- read_msigdb("c5.bp.v6.2.symbols.gmt")
cc <- read_msigdb("c5.cc.v6.2.symbols.gmt")
mf <- read_msigdb("c5.mf.v6.2.symbols.gmt")

x5 <- list(BP =bp, MF= mf, CC =cc)

msig_go <- update_msig_list(x5)
# BP: 905 genes missing (117 without a match)
# MF: 743 genes missing (119 without a match)
# CC: 733 genes missing (81 without a match)

#------------------------
# C6 oncogenic signatures

x6 <- read_msigdb("c6.all.v6.2.symbols.gmt")
x <- unlist(x6, recursive=FALSE)
msig_oncogenic <- update_msig_list(list(tmp=x), format = FALSE)[[1]]
# 921 genes missing (366 without a match)

#------------------------
# C7 immunologic signatures

x7 <- read_msigdb("c7.all.v6.2.symbols.gmt")
x <- unlist(x7, recursive=FALSE)
msig_immunologic <- update_msig_list(list(tmp=x), format = FALSE)[[1]]
# 3229 genes missing (1986 without a match)



save( msig_hallmark,    file ="msig_hallmark.rda")
save( msig_pathways,    file ="msig_pathways.rda")
save( msig_motifs,      file ="msig_motifs.rda")
save( msig_cancer,      file ="msig_cancer.rda")
save( msig_go,          file ="msig_go.rda")
save( msig_oncogenic,   file ="msig_oncogenic.rda")
save( msig_immunologic, file ="msig_immunologic.rda")
