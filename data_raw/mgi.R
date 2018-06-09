#  Human and Mouse Homology with phenotype annotations from MGI

# http://www.informatics.jax.org/mgihome/projects/overview.shtml

## download May 22, 2017

## last database update
## 05/15/2018
## MGI 6.12

url <- "http://www.informatics.jax.org/downloads/reports/HMD_HumanPhenotype.rpt"
# add empty column 8 to avoid parsing failures
message("Downloading ", url)
x <- read_tsv(url, col_names=c("human", "entrez_gene", "homologene", "x1",  "mouse", "id", "phenotype_id", "x2"))
## 408 duplicated mouse genes
message("Duplicated mouse gene?")
print(table(duplicated(x$mouse)))
## group by gene names
mgi <- group_by(x, id, mouse) %>% summarize(n=n(), human = paste(human, collapse=",")) %>%
 ungroup() %>% arrange( grepl("Rik$", mouse), mouse)
# 307 genes with 2 or more homologs
message("Genes with 2 or more homologs")
print(filter(mgi, n>1))
attr(mgi, "downloaded") <- Sys.Date()
attr(mgi, "version") <- "6.12"
message("Saved mgi.rda to data/")
save(mgi, file="../data/mgi.rda")
