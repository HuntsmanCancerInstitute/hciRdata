## Ensembl annotations

    mouse108 <- read_biomart("mouse", version=108)
    human108 <- read_biomart("human", version=108)


      rat108 <- read_biomart("rat")
      fly108 <- read_biomart("fly")
    sheep108 <- read_biomart("sheep")
      pig108 <- read_biomart("pig")
   rabbit108 <- read_biomart("rabbit")
     worm108 <- read_biomart("worm")
   yeast108 <- read_biomart("yeast")
zebrafish108 <- read_biomart("zebrafish")
 elephant108 <- read_biomart("lafricana")
  vervet108  <- read_biomart("csabaeus")


### ADD human homologs to mouse

mouse108$human_homolog <- ""
n <- match(mouse108$gene_name, mgi$mouse)
mouse108$human_homolog <- mgi$human[n]



### 68% of yeast genes names are missing, replace with SGD names.  Fixed in 100
prop.table(table(yeast108$gene_name==""))

# wget https://downloads.yeastgenome.org/curation/chromosomal_feature/SGD_features.tab

sgd <- read_tsv("SGD_features.txt", col_names = c("sgdid", "biotype", "qualifier",
"gene_name", "standard", "alias", "parent", "other_sgid", "chromosome",
"start", "stop", "strand", "pos", "coord", "seq", "description"), guess_max=10800)

n <- match(yeast108$id, sgd$gene_name)
yeast108$gene_name<- sgd$standard[n]


## Descriptions are now missing from fly, fixed in 108

# wget ftp://ftp.flybase.org/releases/FB2019_05/precomputed_files/synonyms/fb_synonym_fb_2019_05.tsv.gz
# grep "^FBgn" fb_synonym_fb_2019_05.tsv | cut -f1-4 > fly_genes.txt

table(is.na(fly108$description))
fly <- read_tsv("../data_raw/fly_genes.txt", col_names=c("id", "abbrev", "name", "description"))
n <- match(fly108$id, fly$id)
fly108$description <- fly$description[n]

##save

# setwd("~/Documents/R/packages/hciRdata/data")
save(mouse108, file = "mouse108.rda")
save(human108, file = "human108.rda")
save(  rat108, file =   "rat108.rda")
save(  fly108, file =   "fly108.rda")
save(sheep108, file = "sheep108.rda")
save(  pig108, file =   "pig108.rda")
save(rabbit108, file="rabbit108.rda")
save(zebrafish108, file = "zebrafish108.rda")
save( worm108, file =  "worm108.rda")
save(yeast108, file = "yeast108.rda")
save(vervet108, file = "vervet108.rda")
save(elephant108, file = "elephant108.rda")


## ADD ensembl homologs to other tables?


 v1 <- read_biomart("csabaeus", attributes = c("ensembl_gene_id", "external_gene_name",
 "hsapiens_homolog_ensembl_gene", "hsapiens_homolog_associated_gene_name",
  "hsapiens_homolog_perc_id"), version=108)
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
 vervet108 <- left_join(vervet108, v2[ ,c(1,5)], by= c(id = "geneid") )
