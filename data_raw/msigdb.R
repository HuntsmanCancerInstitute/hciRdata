# Download from http://software.broadinstitute.org/gsea/msigdb/collections.jsp

version 7.4
C8: cell type signature gene sets


setwd("~/Documents/R/hci/hciRdata/msigdb/v2023.2.Hs")



#------------------------
# H HALLMARK
x1 <- read_msigdb("h.all.v2023.2.Hs.symbols.gmt")
x1 <- lapply(x1, sort)

x <- unique( unlist(x1))

#2 genes missing from human version 102 and 104
y <- sort( x[!x %in% human112$gene_name] )

[1] "METTL7B" "THEG"

z <- filter(hugo, synonym %in% y)

name   synonym type
1 SPMAP2 THEG    previous
2 TMT1B  METTL7B previous


which(sapply(x1, function(x) "THEG" %in% x))


x1[42:43]

lapply(x1, function(x)
    left_join(tibble(synonym =x), z, by = "synonym")



## replace missing gene names in Ensembl with HUGO name  (and drop missing from both lists)
msig_hallmark <- lapply(x1, function(x)
    left_join(tibble(synonym =x), z, by = "synonym") %>%
    mutate(synonym= ifelse(is.na(name), synonym, name)) %>%
   #   filter(!synonym %in% dropGenes ) %>%
	pull(1) %>% sort() )


# check
  x <- unique( unlist(msig_hallmark))
 sort( x[!x %in% human112$gene_name] )

## ALL caps

names(msig_hallmark) <- format_msig(names(msig_hallmark))



#------------------------
# C2 Canonical pathways
x2 <- read_msigdb("c2.cp.v2023.2.Hs.symbols.gmt")

# new wikipathways
sapply(x2, length)
BIOCARTA     KEGG      PID REACTOME       SA      SIG      WNT       WP
     292      805      196     1692       10        8        1      791

update_msig_list <- function(x2, format = TRUE){
 for(i in 1:length(x2)){
   x2[[i]] <- lapply(x2[[i]], sort)
   x <- unique( unlist(x2[[i]]))
   y <- sort( x[!x %in% human112$gene_name] )
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
x3a <- read_msigdb("c3.tft.v2023.2.Hs.symbols.gmt")

## flatten list of lists
# table( sapply(x3, length))
#   1   2   3   4   5   6   7   8  10
# 378  47  11   7   7   2   1   1   2


# MIR: microRNA targets
x3b  <- read_msigdb("c3.mir.v2023.2.Hs.symbols.gmt")

x3 <- list(TFT = unlist(x3a, recursive=FALSE),
            MIR= unlist(x3b, recursive=FALSE))

msig_motifs <- update_msig_list(x3, format = FALSE)
# TFT: 892 genes missing (148 without a match)
# MIR: 483 genes missing (57 without a match)


#------------------------
#  C4 computational gene sets  (cancer)

x4 <- read_msigdb("c4.all.v2023.2.Hs.symbols.gmt")
#sapply(x4, length)
#   CAR    GCM   GNF2 MODULE   MORF
#     6     82    146    431    193

# change 1 to MODULE.001
names(x4$MODULE) <- paste0( "MODULE.", stringr::str_pad(names(x4$MODULE), 3, "left", "0"))


msig_cancer <- update_msig_list(x4, format = FALSE)



#------------------------
#  C5 Gene Ontology (GO) gene sets  (need 3 separate files)

bp <- read_msigdb("c5.go.bp.v2023.2.Hs.symbols.gmt")
cc <- read_msigdb("c5.go.cc.v2023.2.Hs.symbols.gmt")
mf <- read_msigdb("c5.go.mf.v2023.2.Hs.symbols.gmt")

x5 <- list(BP =bp, MF= mf, CC =cc)

msig_go <- update_msig_list(x5)


#------------------------
# C6 oncogenic signatures

x6 <- read_msigdb("c6.all.v2023.2.Hs.symbols.gmt")
x <- unlist(x6, recursive=FALSE)
msig_oncogenic <- update_msig_list(list(tmp=x), format = FALSE)[[1]]
# 921 genes missing (366 without a match)

#------------------------
# C7 immunologic signatures

x7 <- read_msigdb("c7.all.v2023.2.Hs.symbols.gmt")
x <- unlist(x7, recursive=FALSE)
msig_immunologic <- update_msig_list(list(tmp=x), format = FALSE)[[1]]
# 3229 genes missing (1986 without a match)

#------------------------
# C8 cell type signature

x8 <- read_msigdb("c8.all.v2023.2.Hs.symbols.gmt")
x <- unlist(x8, recursive=FALSE)
msig_celltype <- update_msig_list(list(tmp=x), format = FALSE)[[1]]


setwd("~/Documents/R/packages/hciRdata/data")

save(msig_hallmark,    file ="msig_hallmark.rda")
save(msig_pathways,    file ="msig_pathways.rda")
save(msig_motifs,      file ="msig_motifs.rda")
save(msig_cancer,      file ="msig_cancer.rda")
save(msig_go,          file ="msig_go.rda")
save(msig_oncogenic,   file ="msig_oncogenic.rda")
save(msig_immunologic, file ="msig_immunologic.rda")
save(msig_celltype,    file ="msig_celltype.rda")
