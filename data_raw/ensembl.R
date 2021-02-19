## Ensembl annotations

    mouse102 <- read_biomart("mouse")
    human102 <- read_biomart("human")
      rat102 <- read_biomart("rat")
      fly102 <- read_biomart("fly")
    sheep102 <- read_biomart("sheep")
      pig102 <- read_biomart("pig")
   rabbit102 <- read_biomart("rabbit")
     worm102 <- read_biomart("worm")
   yeast102 <- read_biomart("yeast")
zebrafish102 <- read_biomart("zebrafish")
 elephant102 <- read_biomart("lafricana")
 vervet102   <- read_biomart("csabaeus")


### ADD human homologs to mouse

mouse102$human_homolog <- ""
n <- match(mouse102$gene_name, mgi$mouse)
mouse102$human_homolog <- mgi$human[n]

### 68% of yeast genes names are missing, replace with SGD names.  Fixed in 100
prop.table(table(yeast102$gene_name==""))

# wget https://downloads.yeastgenome.org/curation/chromosomal_feature/SGD_features.tab

sgd <- read_tsv("SGD_features.txt", col_names = c("sgdid", "biotype", "qualifier",
"gene_name", "standard", "alias", "parent", "other_sgid", "chromosome",
"start", "stop", "strand", "pos", "coord", "seq", "description"), guess_max=10200)

n <- match(yeast102$id, sgd$gene_name)
yeast102$gene_name<- sgd$standard[n]


## Descriptions are now missing from fly

# wget ftp://ftp.flybase.org/releases/FB2019_05/precomputed_files/synonyms/fb_synonym_fb_2019_05.tsv.gz
# grep "^FBgn" fb_synonym_fb_2019_05.tsv | cut -f1-4 > fly_genes.txt

table(is.na(fly102$description))
fly <- read_tsv("../data_raw/fly_genes.txt", col_names=c("id", "abbrev", "name", "description"))
n <- match(fly102$id, fly$id)
fly102$description <- fly$description[n]

##save

save(mouse102, file = "mouse102.rda", version=2)
save(human102, file = "human102.rda", version=2)
save(  rat102, file =   "rat102.rda", version=2)
save(  fly102, file =   "fly102.rda", version=2)
save(sheep102, file = "sheep102.rda", version=2)
save(  pig102, file =   "pig102.rda", version=2)
save(rabbit102, file="rabbit102.rda", version=2)
save(zebrafish102, file = "zebrafish102.rda", version=2)
save( worm102, file =  "worm102.rda", version=2)
save(yeast102, file = "yeast102.rda", version=2)
save(vervet102, file = "vervet102.rda", version=2)
save(elephant102, file = "elephant102.rda", version=2)


## ADD ensembl homologs to other tables?


 v1 <- read_biomart("csabaeus", attributes = c("ensembl_gene_id", "external_gene_name",
 "hsapiens_homolog_ensembl_gene", "hsapiens_homolog_associated_gene_name",
  "hsapiens_homolog_perc_id"), version=102)
 colnames(v1) <- c("geneid", "gene_name", "human_id", "human_gene", "perc_id")
 v1 <- filter(v1, human_id !="")
## remove homologs with low percent identity
hist(v1$perc_id, br=40)
v1 <- filter(v1, perc_id> 50)

 # Group human homologs by max percent identity.
 v2 <- group_by(v1,  geneid , gene_name) %>%
       filter(perc_id == max(perc_id)) %>%    #
        group_by(geneid , gene_name, perc_id) %>%
         summarize(n=n_distinct(human_id),
            human_homolog = paste(unique(human_gene), collapse=",")) %>%
          ungroup()
 # filter(v2, n>1)

 #Join vervet annotations and homologs.
 vervet102 <- left_join(vervet102, v2[ ,c(1,5)], by= c(id = "geneid") )
