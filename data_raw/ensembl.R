## Ensembl annotations

    mouse98 <- read_biomart("mouse")
    human98 <- read_biomart("human")
      rat98 <- read_biomart("rat")
      fly98 <- read_biomart("fly")
    sheep98 <- read_biomart("sheep")
      pig98 <- read_biomart("pig")
   rabbit98 <- read_biomart("rabbit")
     worm98 <- read_biomart("worm")
   yeast98 <- read_biomart("yeast")
zebrafish98 <- read_biomart("zebrafish")
 elephant98 <- read_biomart("lafricana")
 vervet98 <- read_biomart("csabaeus")

nrow(human98)
nrow(mouse98)
nrow(fly98)
nrow(rat98)
nrow(pig98)
nrow(sheep98)
nrow(rabbit98)
nrow(vervet98)
nrow(zebrafish98)
nrow(worm98)
nrow(yeast98)
nrow(elephant98)


### ADD human homologs to mouse

mouse98$human_homolog <- ""
n <- match(mouse98$gene_name, mgi$mouse)
mouse98$human_homolog <- mgi$human[n]


## Descriptions are now missing from fly

# wget ftp://ftp.flybase.org/releases/FB2019_05/precomputed_files/synonyms/fb_synonym_fb_2019_05.tsv.gz
# grep "^FBgn" fb_synonym_fb_2019_05.tsv | cut -f1-4 > fly_genes.txt

fly <- read_tsv("fly_genes.txt", col_names=c("id", "abbrev", "name", "description"))
n <- match(fly98$id, fly$id)
fly98$description <- fly$description[n]



##save

save(mouse98, file = "mouse98.rda", version=2)
save(human98, file = "human98.rda", version=2)
save(  rat98, file =   "rat98.rda", version=2)
save(  fly98, file =   "fly98.rda", version=2)
save(sheep98, file = "sheep98.rda", version=2)
save(  pig98, file =   "pig98.rda", version=2)
save(rabbit98, file="rabbit98.rda", version=2)
save(zebrafish98, file = "zebrafish98.rda", version=2)
save( worm98, file =  "worm98.rda", version=2)
save(yeast98, file = "yeast98.rda", version=2)
save(vervet98, file = "vervet98.rda", version=2)
save(elephant98, file = "elephant98.rda", version=2)






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
