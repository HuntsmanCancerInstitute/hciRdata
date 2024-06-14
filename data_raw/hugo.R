
## GENE synonyms from HUGO rest service

# Ensembl 112
## NEW June 13, 2024

url <- "https://g-a8b222.dd271.03c0.data.globus.org/pub/databases/genenames/hgnc/tsv/non_alt_loci_set.txt"

x <- hugo_raw[, c(2,9,11)]

x <- hugo_raw[, c(2,9,11, 20)]
x
# A tibble: 43,803 × 4
   symbol    alias_symbol                  prev_symbol               ensembl_gene_id
   <chr>     <chr>                         <chr>                     <chr>
 1 A1BG      NA                            NA                        ENSG00000121410
 2 A1BG-AS1  FLJ23569                      NCRNA00181|A1BGAS|A1BG-AS ENSG00000268895
 3 A1CF      ACF|ASP|ACF64|ACF65|APOBEC1CF NA                        ENSG00000148584
 4 A2M       FWP007|S863-7|CPAMD5          NA                        ENSG00000175899

 table(table(x$symbol))

     1
 43803

filter(x[, 1:2], !is.na(alias_symbol  ))

# alias and previous
x1 <- filter(x[, 1:2], !is.na(alias_symbol  )) %>% separate_rows( alias_symbol, sep="\\|")
names(x1)[1:2] <- c("name", "synonym")
x1$type <- "alias"

x2 <- filter(x[, c(1,3)], !is.na(prev_symbol  )) %>% separate_rows( prev_symbol, sep="\\|")
names(x2)[1:2] <- c("name", "synonym")
x2$type <- "previous"


hugo <- bind_rows(x1, x2) %>% arrange(name, synonym )

save(hugo, file = "hugo.rda")


###----------------------

url <- "https://www.genenames.org/cgi-bin/download?col=gd_app_sym&col=gd_app_name&col=gd_locus_group&col=gd_prev_sym&col=gd_aliases&col=md_ensembl_id&status=Approved&format=text&submit=submit"
hugo_raw <- read_tsv( url)
colnames(hugo_raw) <- c("name", "description", "biotype", "previous", "synonyms", "ensembl_id")


## separate comma-separated gene lists in previous and synonym fields (protein-coding only)

hugo <- bind_rows(
filter(hugo_raw, !is.na(previous), biotype == "protein-coding gene") %>%
    dplyr::select(name, previous) %>% separate_rows(previous, sep = ", *") %>%
      rename(synonym = "previous") %>% mutate(source = "Previous symbol") ,
filter(hugo_raw, !is.na(synonyms), biotype == "protein-coding gene") %>%
    dplyr::select(name, synonyms) %>% separate_rows(synonyms, sep = ", *") %>%
      rename(synonym="synonyms") %>% mutate(source = "Synonyms") ) %>%
       arrange(name)

#filter(hugo, !name %in% human92$gene_name) %>% pull(name) %>% unique()

save(hugo, file = "hugo.rda", version=2)
