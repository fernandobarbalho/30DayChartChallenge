library(readxl)
library(tidyverse)

fauna_uc_26nov2025 <- 
  read_excel("fauna_uc_26nov2025.xlsx") %>%
  bind_rows(
    read_excel("fauna_uc_26nov2025.xlsx", 
                                     sheet = "Página 2"),
    read_excel("fauna_uc_26nov2025.xlsx", 
               sheet = "Página 3")
  ) %>%
  janitor::clean_names() 


fauna_uc_26nov2025_trabalho<-
  fauna_uc_26nov2025 %>%
  mutate(categoria_validacao = ifelse(categoria_validacao=="Criticamente em Perigo (CR) (PE)", "Criticamente em Perigo (CR)", categoria_validacao))

saveRDS(fauna_uc_26nov2025_trabalho, "fauna_uc_26nov2025_trabalho.rds")

unique(fauna_uc_26nov2025$categoria_validacao)
