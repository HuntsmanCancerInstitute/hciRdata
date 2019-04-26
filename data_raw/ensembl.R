## Ensembl annotations

    mouse96 <- read_biomart("mouse")
    human96 <- read_biomart("human")
      rat96 <- read_biomart("rat")
      fly96 <- read_biomart("fly")
    sheep96 <- read_biomart("sheep")
      pig96 <- read_biomart("pig")
   rabbit96 <- read_biomart("rabbit")
     worm96 <- read_biomart("worm")
   yeast96 <- read_biomart("yeast")
zebrafish96 <- read_biomart("zebrafish")
 elephant96 <- read_biomart("lafricana")
 vervet96 <- read_biomart("csabaeus")



### ADD human homologs to mmu

mouse96$human_homolog <- ""
n <- match(mouse96$gene_name, mgi_6.13$mouse)
mouse96$human_homolog <- mgi_6.13$human[n]



##save


save(mouse96, file = "mouse96.rda")
save(human96, file = "human96.rda")
save(  rat96, file =   "rat96.rda")
save(  fly96, file =   "fly96.rda")
save(sheep96, file = "sheep96.rda")
save(  pig96, file =   "pig96.rda")
save(rabbit96, file="rabbit96.rda")
save(zebrafish96, file = "zebrafish96.rda")
save( worm96, file =  "worm96.rda")
save(yeast96, file = "yeast96.rda")
save(vervet96, file = "vervet96.rda")
save(elephant96, file = "elephant96.rda")






## ADD ensembl homologs?

 v1 <- read_biomart("csabaeus", attributes = c("ensembl_gene_id", "external_gene_name",
 "hsapiens_homolog_ensembl_gene", "hsapiens_homolog_associated_gene_name",
  "hsapiens_homolog_perc_id"))
 colnames(v1) <- c("geneid", "gene_name", "human_id", "human_gene", "perc_id")
 v1 <- filter(v1, human_id !="")
## remove homologs with low percent identity
hist(v1$perc_id, br=40)
hist(v1$perc_id[v1$perc_id<50], br=40)
v1 <- filter(v1, perc_id> 35)

 # Group human homologs by max percent identity.
 vervet94a <- group_by(v1,  geneid , gene_name) %>%
       filter(perc_id == max(perc_id)) %>%    #
        group_by(geneid , gene_name, perc_id) %>%
         summarize(n=n_distinct(human_id),
            human_homolog = paste(unique(human_gene), collapse=",")) %>%
          ungroup()
 # filter(vervet94a, n>1)

 #Join vervet annotations and homologs.
 vervet94 <- left_join(vervet, vervet94a[ ,c(1,5)], by= c(id = "geneid") )
