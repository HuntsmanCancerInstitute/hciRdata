
## GENE synonyms from HUGO rest service


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

save(hugo, file = "hugo.rda")
