## Ensembl annotations

    mouse94 <- read_biomart("mouse")
    human94 <- read_biomart("human")
      rat94 <- read_biomart("rat")
      fly94 <- read_biomart("fly")
    sheep94 <- read_biomart("sheep")
      pig94 <- read_biomart("pig")
   rabbit94 <- read_biomart("rabbit")
     worm94 <- read_biomart("worm")
zebrafish94 <- read_biomart("zebrafish")


mouse90 <- read_biomart("mouse", version=90)
human90 <- read_biomart("human", version=90)
rat90 <- read_biomart("rat", version=90)
fly90 <- read_biomart("fly", version=90)
sheep90 <- read_biomart("sheep", version=90)
pig90 <- read_biomart("pig", version=90)
rabbit90 <- read_biomart("rabbit", version=90)
worm90 <- read_biomart("worm", version=90)
zebrafish90 <- read_biomart("zebrafish", version=90)


mouse92 <- read_biomart("mouse", version=92)
human92 <- read_biomart("human", version=92)
rat92 <- read_biomart("rat", version=92)
fly92 <- read_biomart("fly", version=92)
sheep92 <- read_biomart("sheep", version=92)
pig92 <- read_biomart("pig", version=92)
rabbit92 <- read_biomart("rabbit", version=92)
worm92 <- read_biomart("worm", version=92)
zebrafish92 <- read_biomart("zebrafish", version=92)


### ADD human homologs to mmu
data(mgi)

mouse94$human_homolog <- ""
n <- match(mouse94$gene_name, mgi$mouse)
mouse94$human_homolog <- mgi$human[n]


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


save(mouse92, file = "mouse92.rda")
save(human92, file = "human92.rda")
save(  rat92, file =   "rat92.rda")
save(  fly92, file =   "fly92.rda")
save(sheep92, file = "sheep92.rda")
save(  pig92, file =   "pig92.rda")
save(rabbit92, file="rabbit92.rda")
save(zebrafish92,file="zebrafish92.rda")
save( worm92, file =  "worm92.rda")


save(mouse94, file = "mouse94.rda")
save(human94, file = "human94.rda")
save(  rat94, file =   "rat94.rda")
save(  fly94, file =   "fly94.rda")
save(sheep94, file = "sheep94.rda")
save(  pig94, file =   "pig94.rda")
save(rabbit94, file="rabbit94.rda")
save(zebrafish94, file = "zebrafish94.rda")
save( worm94, file =  "worm94.rda")
save(yeast94, file = "yeast94.rda")

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

mouse92_homologs <- group_by(x, id, mouse) %>%
      filter(perc_id == max(perc_id)) %>%    #
       group_by(id, mouse, perc_id) %>%
        summarize(n=n_distinct(human), human = paste(unique(human), collapse=",")) %>% ungroup()

save(mouse92_homologs, file = "mouse92_homologs.rda")
