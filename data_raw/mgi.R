#  Human and Mouse Homology with phenotype annotations from MGI

# http://www.informatics.jax.org/mgihome/projects/overview.shtml

## last database update

# 12/08/2020 MGI 6.16
# 5/05/2020 MGI 6.15
# 09/25/2019 MGI 6.14
# 04/16/2019 MGI 6.13
# 10/09/2018 MGI 6.12


url <- "http://www.informatics.jax.org/downloads/reports/HMD_HumanPhenotype.rpt"
# add empty column 8 to avoid parsing failures
message("Downloading ", url)
x <- read_tsv(url, col_names=c("human", "entrez_gene", "homologene", "x1",  "mouse", "id", "phenotype_id", "x2"))
## duplicated mouse genes
table(duplicated(x$mouse))

# Group by gene names
mgi <- group_by(x, id, mouse) %>% summarize(n=n(), human = paste(human, collapse=",")) %>%
 ungroup() %>% arrange( grepl("Rik$", mouse), mouse)
# 206 genes with 2 or more homologs
filter(mgi, n>1)

attr(mgi, "downloaded") <- Sys.Date()

save(mgi, file="mgi.rda", version=2)
