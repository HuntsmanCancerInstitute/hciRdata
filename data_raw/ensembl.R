## Ensembl annotations


human112 <- read_biomart("human", version=112)

human112 <- read_biomart("human", version=112)
Using Ensembl release 112
Error in biomaRt::getBM(attributes = c("ensembl_gene_id", "external_gene_name",  :
  Invalid attribute(s): transcript_count
Please use the function 'listAttributes' to get valid attribute names

x1 <- read_biomart("human", list= "attributes")

## NO transcript count!
filter(x1, grepl("transcript", name))

c("ensembl_gene_id", "external_gene_name", "gene_biotype", "chromosome_name",
"start_position", "end_position", "strand", "description", "transcript_count")  %in% x1$name


human112 <- read_biomart("human", version=112, attributes= c("ensembl_gene_id",
  "external_gene_name", "gene_biotype", "chromosome_name",
  "start_position", "end_position", "strand", "description") )

names(human112)[1:6] <- c("id", "gene_name", "biotype",
                  "chromosome", "start", "end")
human112$description <- gsub(" \\[.*\\]$", "", human112$description)
human112$description <- trimws(human112$description)
human112 <- dplyr::arrange(human112, id)


# drop patch

human112 <- filter(human112, !grepl( "^HSCHR|PATCH$", chromosome))


### ADD human homologs to mouse

mouse112 <- read_biomart("mouse", version=112)

mouse112$human_homolog <- ""
n <- match(mouse112$gene_name, mgi$mouse)
mouse112$human_homolog <- mgi$human[n]


#-------------




      rat112 <- read_biomart("rat", version=112)
      fly112 <- read_biomart("fly", version=112)
    sheep112 <- read_biomart("sheep", version=112)
      pig112 <- read_biomart("pig", version=112)
   rabbit112 <- read_biomart("rabbit", version=112)
     worm112 <- read_biomart("worm", version=112)
   yeast112 <- read_biomart("yeast", version=112)
zebrafish112 <- read_biomart("zebrafish", version=112)
 elephant112 <- read_biomart("lafricana", version=112)
  vervet112  <- read_biomart("csabaeus", version=112)



### 68% of yeast genes names are missing, replace with SGD names.  Fixed in 100
prop.table(table(yeast112$gene_name==""))

# wget https://downloads.yeastgenome.org/curation/chromosomal_feature/SGD_features.tab

sgd <- read_tsv("SGD_features.txt", col_names = c("sgdid", "biotype", "qualifier",
"gene_name", "standard", "alias", "parent", "other_sgid", "chromosome",
"start", "stop", "strand", "pos", "coord", "seq", "description"), guess_max=11200)

n <- match(yeast112$id, sgd$gene_name)
yeast112$gene_name<- sgd$standard[n]


## Descriptions are now missing from fly, fixed in 112

# wget ftp://ftp.flybase.org/releases/FB2019_05/precomputed_files/synonyms/fb_synonym_fb_2019_05.tsv.gz
# grep "^FBgn" fb_synonym_fb_2019_05.tsv | cut -f1-4 > fly_genes.txt

table(is.na(fly112$description))
fly <- read_tsv("../data_raw/fly_genes.txt", col_names=c("id", "abbrev", "name", "description"))
n <- match(fly112$id, fly$id)
fly112$description <- fly$description[n]

##save

# setwd("~/Documents/R/packages/hciRdata/data")
save(mouse112, file = "mouse112.rda")
save(human112, file = "human112.rda")
save(  rat112, file =   "rat112.rda")
save(  fly112, file =   "fly112.rda")
save(sheep112, file = "sheep112.rda")
save(  pig112, file =   "pig112.rda")
save(rabbit112, file="rabbit112.rda")
save(zebrafish112, file = "zebrafish112.rda")
save( worm112, file =  "worm112.rda")
save(yeast112, file = "yeast112.rda")
save(vervet112, file = "vervet112.rda")
save(elephant112, file = "elephant112.rda")






## ADD ensembl homologs to other tables?


 v1 <- read_biomart("csabaeus", attributes = c("ensembl_gene_id", "external_gene_name",
 "hsapiens_homolog_ensembl_gene", "hsapiens_homolog_associated_gene_name",
  "hsapiens_homolog_perc_id"), version=112)
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
 vervet112 <- left_join(vervet112, v2[ ,c(1,5)], by= c(id = "geneid") )
