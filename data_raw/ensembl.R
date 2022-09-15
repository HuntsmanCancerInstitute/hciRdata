## Ensembl annotations

    mouse106 <- read_biomart("mouse")
    human106 <- read_biomart("human")
      rat106 <- read_biomart("rat")
      fly106 <- read_biomart("fly")
    sheep106 <- read_biomart("sheep")
      pig106 <- read_biomart("pig")
   rabbit106 <- read_biomart("rabbit")
     worm106 <- read_biomart("worm")
   yeast106 <- read_biomart("yeast")
zebrafish106 <- read_biomart("zebrafish")
 elephant106 <- read_biomart("lafricana")
  vervet106  <- read_biomart("csabaeus")


### ADD human homologs to mouse

mouse106$human_homolog <- ""
n <- match(mouse106$gene_name, mgi$mouse)
mouse106$human_homolog <- mgi$human[n]



### 68% of yeast genes names are missing, replace with SGD names.  Fixed in 100
prop.table(table(yeast106$gene_name==""))

# wget https://downloads.yeastgenome.org/curation/chromosomal_feature/SGD_features.tab

sgd <- read_tsv("SGD_features.txt", col_names = c("sgdid", "biotype", "qualifier",
"gene_name", "standard", "alias", "parent", "other_sgid", "chromosome",
"start", "stop", "strand", "pos", "coord", "seq", "description"), guess_max=10600)

n <- match(yeast106$id, sgd$gene_name)
yeast106$gene_name<- sgd$standard[n]


## Descriptions are now missing from fly, fixed in 106

# wget ftp://ftp.flybase.org/releases/FB2019_05/precomputed_files/synonyms/fb_synonym_fb_2019_05.tsv.gz
# grep "^FBgn" fb_synonym_fb_2019_05.tsv | cut -f1-4 > fly_genes.txt

table(is.na(fly106$description))
fly <- read_tsv("../data_raw/fly_genes.txt", col_names=c("id", "abbrev", "name", "description"))
n <- match(fly106$id, fly$id)
fly106$description <- fly$description[n]

##save

# setwd("~/Documents/R/packages/hciRdata/data")
save(mouse106, file = "mouse106.rda")
save(human106, file = "human106.rda")
save(  rat106, file =   "rat106.rda")
save(  fly106, file =   "fly106.rda")
save(sheep106, file = "sheep106.rda")
save(  pig106, file =   "pig106.rda")
save(rabbit106, file="rabbit106.rda")
save(zebrafish106, file = "zebrafish106.rda")
save( worm106, file =  "worm106.rda")
save(yeast106, file = "yeast106.rda")
save(vervet106, file = "vervet106.rda")
save(elephant106, file = "elephant106.rda")


## ADD ensembl homologs to other tables?


 v1 <- read_biomart("csabaeus", attributes = c("ensembl_gene_id", "external_gene_name",
 "hsapiens_homolog_ensembl_gene", "hsapiens_homolog_associated_gene_name",
  "hsapiens_homolog_perc_id"), version=106)
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
 vervet106 <- left_join(vervet106, v2[ ,c(1,5)], by= c(id = "geneid") )
