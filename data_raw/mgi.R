#  Human and Mouse Homology with phenotype annotations from MGI

# http://www.informatics.jax.org/mgihome/projects/overview.shtml


## download May 22, 2018

## last database update
# 04/16/2019
# MGI 6.13

## 10/09/2018
# MGI 6.12

# mgi_6.12 <- mgi


url <- "http://www.informatics.jax.org/downloads/reports/HMD_HumanPhenotype.rpt"
# add empty column 8 to avoid parsing failures
message("Downloading ", url)
x <- read_tsv(url, col_names=c("human", "entrez_gene", "homologene", "x1",  "mouse", "id", "phenotype_id", "x2"))
## duplicated mouse genes
table(duplicated(x$mouse))

# Group by gene names
mgi_6.13 <- group_by(x, id, mouse) %>% summarize(n=n(), human = paste(human, collapse=",")) %>%
 ungroup() %>% arrange( grepl("Rik$", mouse), mouse)
#  genes with 2 or more homologs
filter(mgi_6.13, n>1)

attr(mgi_6.13, "downloaded") <- Sys.Date()
save(mgi_6.13, file="mgi_6.13.rda")
save(mgi_6.12, file="mgi_6.12.rda")
