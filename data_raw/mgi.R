#  Human and Mouse Homology with phenotype annotations from MGI

# http://www.informatics.jax.org/mgihome/projects/overview.shtml


## download May 22, 2018

## last database update
## 10/09/2018
# MGI 6.12

url <- "http://www.informatics.jax.org/downloads/reports/HMD_HumanPhenotype.rpt"
# add empty column 8 to avoid parsing failures
message("Downloading ", url)
x <- read_tsv(url, col_names=c("human", "entrez_gene", "homologene", "x1",  "mouse", "id", "phenotype_id", "x2"))
## duplicated mouse genes
table(duplicated(x$mouse))
# FALSE  TRUE
# 18117   269

# Group by gene names
mgi <- group_by(x, id, mouse) %>% summarize(n=n(), human = paste(human, collapse=",")) %>%
 ungroup() %>% arrange( grepl("Rik$", mouse), mouse)
# 307 genes with 2 or more homologs
filter(mgi, n>1)
# A tibble: 198 x 4
#   id          mouse       n human
#   <chr>       <chr>   <int> <chr>
# 1 MGI:2385289 Acsm2       2 ACSM2A,ACSM2B
# 2 MGI:87921   Adh1        3 ADH1A,ADH1B,ADH1C
# 3 MGI:87984   Akp3        2 ALPG,ALPI
# 4 MGI:1915111 Akr1b10     2 AKR1B10,AKR1B15

attr(mgi, "downloaded") <- Sys.Date()
attr(mgi, "version") <- "6.12"
save(mgi, file="mgi.rda")
