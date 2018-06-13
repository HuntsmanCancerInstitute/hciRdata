## Ensembl annotations

mouse90 <- read_biomart_version("mouse", version=90)
mouse92 <- read_biomart_version("mouse", version=92)

human90 <- read_biomart_version("human", version=90)
human92 <- read_biomart_version("human", version=92)

rat90 <- read_biomart_version("rat", version=90)
rat92 <- read_biomart_version("rat", version=92)

fly90 <- read_biomart_version("fly", version=90)
fly92 <- read_biomart_version("fly", version=92)

sheep90 <- read_biomart_version("sheep", version=90)
sheep92 <- read_biomart_version("sheep", version=92)

pig90 <- read_biomart_version("pig", version=90)
pig92 <- read_biomart_version("pig", version=92)

rabbit90 <- read_biomart_version("rabbit", version=90)
rabbit92 <- read_biomart_version("rabbit", version=92)

worm90 <- read_biomart_version("worm", version=90)
worm92 <- read_biomart_version("worm", version=92)

zebrafish90 <- read_biomart_version("zebrafish", version=90)
zebrafish92 <- read_biomart_version("zebrafish", version=92)

yeast90 <- read_biomart_version("yeast", version=90)
yeast92 <- read_biomart_version("yeast", version=92)

### ADD human homologs to mmu
data(mgi)

mouse92$human_homolog <- ""
n <- match(mouse92$gene_name, mgi$mouse)
mouse92$human_homolog <- mgi$human[n]

mouse90$human_homolog <- ""
n <- match(mouse90$gene_name, mgi$mouse)
mouse90$human_homolog <- mgi$human[n]

##save

save(mouse90, file = "mouse90.rda")
save(human90, file = "human90.rda")
save(  rat90, file =   "rat90.rda")
save(  fly90, file =   "fly90.rda")
save(sheep90, file = "sheep90.rda")
save(  pig90, file =   "pig90.rda")
save(rabbit90, file="rabbit90.rda")
save(zebrafish90, file = "zebrafish90.rda")
save( worm90, file =  "worm90.rda")
save(yeast90, file = "yeast90.rda")

save(mouse92, file = "mouse92.rda")
save(human92, file = "human92.rda")
save(  rat92, file =   "rat92.rda")
save(  fly92, file =   "fly92.rda")
save(sheep92, file = "sheep92.rda")
save(  pig92, file =   "pig92.rda")
save(rabbit92, file="rabbit92.rda")
save(zebrafish92,file="zebrafish92.rda")
save( worm92, file =  "worm92.rda")
save(yeast92, file = "yeast92.rda")



## Human homologs in Mouse

x <- read_biomart("mouse",  attributes = c("ensembl_gene_id", "external_gene_name",
  "hsapiens_homolog_ensembl_gene", "hsapiens_homolog_associated_gene_name",
 "hsapiens_homolog_perc_id"))

colnames(x) <- c("id", "mouse", "human_id", "human", "perc_id")
x <- filter(x, homolog !="")

# Drop homologs with percent identity <  35% ?

hist(x$perc_id[x$perc_id<40], br=40)
x <- filter(x, perc_id> 35)

## GET all homologs with max percent identity and combine into a comma-delimited list

mouse92_homologs <- group_by(x, id, mouse, perc_id) %>%
      filter(perc_id == max(perc_id)) %>%    #
       group_by(id, mouse, perc_id) %>%
        summarize(n=n_distinct(human), human = paste(unique(human), collapse=",")) %>% ungroup()

save(mouse92_homologs, file = "mouse92_homologs.rda")
