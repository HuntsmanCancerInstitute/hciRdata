## Ensembl annotations

    mouse104 <- read_biomart("mouse")
    human104 <- read_biomart("human")
      rat104 <- read_biomart("rat")
      fly104 <- read_biomart("fly")
    sheep104 <- read_biomart("sheep")
      pig104 <- read_biomart("pig")
   rabbit104 <- read_biomart("rabbit")
     worm104 <- read_biomart("worm")
   yeast104 <- read_biomart("yeast")
zebrafish104 <- read_biomart("zebrafish")
 elephant104 <- read_biomart("lafricana")
  vervet104  <- read_biomart("csabaeus")


### ADD human homologs to mouse

mouse104$human_homolog <- ""
n <- match(mouse104$gene_name, mgi$mouse)
mouse104$human_homolog <- mgi$human[n]



### 68% of yeast genes names are missing, replace with SGD names.  Fixed in 100
prop.table(table(yeast104$gene_name==""))

# wget https://downloads.yeastgenome.org/curation/chromosomal_feature/SGD_features.tab

sgd <- read_tsv("SGD_features.txt", col_names = c("sgdid", "biotype", "qualifier",
"gene_name", "standard", "alias", "parent", "other_sgid", "chromosome",
"start", "stop", "strand", "pos", "coord", "seq", "description"), guess_max=10400)

n <- match(yeast104$id, sgd$gene_name)
yeast104$gene_name<- sgd$standard[n]


## Descriptions are now missing from fly, fixed in 104

# wget ftp://ftp.flybase.org/releases/FB2019_05/precomputed_files/synonyms/fb_synonym_fb_2019_05.tsv.gz
# grep "^FBgn" fb_synonym_fb_2019_05.tsv | cut -f1-4 > fly_genes.txt

table(is.na(fly104$description))
fly <- read_tsv("../data_raw/fly_genes.txt", col_names=c("id", "abbrev", "name", "description"))
n <- match(fly104$id, fly$id)
fly104$description <- fly$description[n]

##save

# setwd("~/Documents/R/packages/hciRdata/data")
save(mouse104, file = "mouse104.rda")
save(human104, file = "human104.rda")
save(  rat104, file =   "rat104.rda")
save(  fly104, file =   "fly104.rda")
save(sheep104, file = "sheep104.rda")
save(  pig104, file =   "pig104.rda")
save(rabbit104, file="rabbit104.rda")
save(zebrafish104, file = "zebrafish104.rda")
save( worm104, file =  "worm104.rda")
save(yeast104, file = "yeast104.rda")
save(vervet104, file = "vervet104.rda")
save(elephant104, file = "elephant104.rda")


## ADD ensembl homologs to other tables?


 v1 <- read_biomart("csabaeus", attributes = c("ensembl_gene_id", "external_gene_name",
 "hsapiens_homolog_ensembl_gene", "hsapiens_homolog_associated_gene_name",
  "hsapiens_homolog_perc_id"), version=104)
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
 vervet104 <- left_join(vervet104, v2[ ,c(1,5)], by= c(id = "geneid") )
