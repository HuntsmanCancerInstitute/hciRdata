## Ensembl annotations

    mouse100 <- read_biomart("mouse")
    human100 <- read_biomart("human")
      rat100 <- read_biomart("rat")
      fly100 <- read_biomart("fly")
    sheep100 <- read_biomart("sheep")
      pig100 <- read_biomart("pig")
   rabbit100 <- read_biomart("rabbit")
     worm100 <- read_biomart("worm")
   yeast100 <- read_biomart("yeast")
zebrafish100 <- read_biomart("zebrafish")
 elephant100 <- read_biomart("lafricana")
 vervet100 <- read_biomart("csabaeus")

nrow(human100)
nrow(mouse100)
nrow(fly100)
nrow(rat100)
nrow(pig100)
nrow(sheep100)
nrow(rabbit100)
nrow(vervet100)
nrow(zebrafish100)
nrow(worm100)
nrow(yeast100)
nrow(elephant100)


### ADD human homologs to mouse

mouse100$human_homolog <- ""
n <- match(mouse100$gene_name, mgi$mouse)
mouse100$human_homolog <- mgi$human[n]

### 68% of yeast genes names are missing, replace with SGD names.  Fixed in 100

# wget https://downloads.yeastgenome.org/curation/chromosomal_feature/SGD_features.tab

sgd <- read_tsv("SGD_features.txt", col_names = c("sgdid", "biotype", "qualifier",
"gene_name", "standard", "alias", "parent", "other_sgid", "chromosome",
"start", "stop", "strand", "pos", "coord", "seq", "description"), guess_max=10000)

n <- match(yeast100$id, sgd$gene_name)
yeast100$gene_name<- sgd$standard[n]


## Descriptions are now missing from fly

# wget ftp://ftp.flybase.org/releases/FB2019_05/precomputed_files/synonyms/fb_synonym_fb_2019_05.tsv.gz
# grep "^FBgn" fb_synonym_fb_2019_05.tsv | cut -f1-4 > fly_genes.txt

table(is.na(fly100$description))
fly <- read_tsv("data_raw/fly_genes.txt", col_names=c("id", "abbrev", "name", "description"))
n <- match(fly100$id, fly$id)
fly100$description <- fly$description[n]

##save

save(mouse100, file = "mouse100.rda", version=2)
save(human100, file = "human100.rda", version=2)
save(  rat100, file =   "rat100.rda", version=2)
save(  fly100, file =   "fly100.rda", version=2)
save(sheep100, file = "sheep100.rda", version=2)
save(  pig100, file =   "pig100.rda", version=2)
save(rabbit100, file="rabbit100.rda", version=2)
save(zebrafish100, file = "zebrafish100.rda", version=2)
save( worm100, file =  "worm100.rda", version=2)
save(yeast100, file = "yeast100.rda", version=2)
save(vervet100, file = "vervet100.rda", version=2)
save(elephant100, file = "elephant100.rda", version=2)


## ADD ensembl homologs to other tables?

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
