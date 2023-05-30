#  Human and Mouse Homology with phenotype annotations from MGI

# http://www.informatics.jax.org/mgihome/projects/overview.shtml

## last database update

# 12/27/2022 MGI 6.22  108


# 06/23/2022 MGI 6.20  106

# 06/08/2021 MGI 6.17 ??? Empty table!
# 12/08/2020 MGI 6.16
# 5/05/2020 MGI 6.15
# 09/25/2019 MGI 6.14
# 04/16/2019 MGI 6.13
# 10/09/2018 MGI 6.12


url <- "http://www.informatics.jax.org/downloads/reports/HMD_HumanPhenotype.rpt"
# add empty column 8 to avoid parsing failures
message("Downloading ", url)
x <- read_tsv(url, col_names=c("human", "entrez_gene", "homologene", "x1",  "mouse", "id", "phenotype_id", "x2"))

# ensembl 108
x <- read_tsv(url, col_names=c("human", "entrez_gene", "mouse", "id", "mp", "x1"))

## duplicated mouse genes
table(duplicated(x$mouse))

FALSE  TRUE
20131  9555


# Group by gene names
mgi <- group_by(x, id, mouse) %>% summarize(n=n(), human = paste(human, collapse=",")) %>%
 ungroup() %>% filter(n !=41) %>% arrange( grepl("Rik$", mouse), mouse)

## 1704 in mgi 6.2

z <- filter(mgi, n>1)

filter(z,  str_detect(human, fixed(mouse, ignore_case=TRUE)) )


filter(z,  str_detect(human, fixed(mouse, ignore_case=TRUE)) )
# A tibble: 632 × 4
   id          mouse       n human
   <chr>       <chr>   <int> <chr>
 1 MGI:1916934 Aarsd1      2 AARSD1,PTGES3L-AARSD1
 2 MGI:1351657 Abcf2       2 ABCF2,ABCF2-H2BK1
 3 MGI:1349396 Acot1       2 ACOT1,ACOT2
 4 MGI:2159605 Acot2       2 ACOT1,ACOT2
 5 MGI:2385289 Acsm2       2 ACSM2A,ACSM2B
 6 MGI:1347095 Adgre5      2 ADGRE2,ADGRE5
 7 MGI:87921   Adh1        3 ADH1A,ADH1B,ADH1C



# 206 genes with 2 or more homologs
filter(mgi, n>1)

attr(mgi, "downloaded") <- Sys.Date()

save(mgi, file="mgi.rda", version=2)
