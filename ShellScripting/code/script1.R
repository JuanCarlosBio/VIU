#!/usr/bin/env Rscript
library(dplyr)

human_coordinates1 <- read.table("../data/human_coordinates_1.bed")

human_coordinates1 %>%
  group_by(V1) %>%
  count() %>%
  #arrange(V1) %>%
  print(n=Inf) %>% nrow()

human_coordinates2 <- read.table("../data/human_coordinates_2.bed") 

human_coordinates2 %>%
  group_by(V1) %>%
  count() %>%
  #arrange(V1) %>%
  print(n=Inf) %>% nrow()
