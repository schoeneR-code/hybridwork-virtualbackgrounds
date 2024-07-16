library(tidyverse)
library(rstatix)


 #load(".../data_g1.Rda")
data <- ds %>% 
  filter(AC01 == 1)


# create dataset
data2 <- data %>% 
  mutate(SQ01_numeric = as.numeric(as.character(SQ01)),
         sekundaerscore = abs(SQ01_numeric - 13),
         Q1corr = case_when(
           PQ01 == 3 ~ TRUE,
           TRUE ~ FALSE),
         Q2corr = case_when(
           PQ02 == 3 ~ TRUE,
           TRUE ~ FALSE),
         Q3corr = case_when(
           PQ04 == 2 ~ TRUE,
           TRUE ~ FALSE),
         Q4corr = case_when(
           PQ05 == 2 ~ TRUE,
           TRUE ~ FALSE),
         RA01 = as.factor(RA01),
         RA01 = case_when(
           RA01 == 1 ~ "books",
           RA01 == 2 ~ "plant",
           RA01 == 3 ~ "white")
  ) %>% 
  mutate(sekundaerscore = case_when(
    CASE == 138 ~ 0,
    TRUE ~ sekundaerscore)) %>% 
  rowwise() %>% 
  mutate(primaerscore = sum(Q1corr, Q2corr, Q3corr, Q4corr)) %>% 
  ungroup() %>%
  levels(RA01)

select(-SQ01_numeric)


data2 <- data2 %>%
  mutate(RA01 = fct_relevel(RA01, "white"))



data2 %>% 
  group_by(RA01) %>% 
  count()

# Primäraufgabe
data2 %>% 
  group_by(RA01) %>% 
  summarize(mean = mean(primaerscore), sd = sd(primaerscore), n = n())

lm(primaerscore ~ RA01, data = data2) %>% 
  summary()

# Als T-Test zwischen Books & Plants
data2 %>% 
  filter(RA01 != "white") %>% 
  t.test(primaerscore ~ RA01, data = ., alternative = "less")

data2 %>% 
  filter(RA01 != "white") %>% 
  droplevels() %>% 
  cohens_d(primaerscore ~ RA01, paired = F, var.equal = F)


boxplot(primaerscore ~ RA01,
        data = data2
)

res_aov <- aov(primaerscore ~ RA01,
               data = data2
)

summary(res_aov)



 
# Sekundäraufgabe
hist(data2$sekundaerscore,
     main = "Histogramm Sekundäraufgabenabweichung",
     xlab = "Betrag der Abweichung der Sekundaraufgaben")
data2 %>% 
  #filter(sekundaerscore < 4) %>% 
  group_by(RA01) %>% 
  summarize(mean = mean(sekundaerscore), sd = sd(sekundaerscore), n = n())

lm(sekundaerscore ~ RA01, data = data2) %>% 
  summary()


lm(sekundaerscore ~ RA01, data = data2 %>% 
     filter(sekundaerscore < 4)) %>% 
  summary()

# als T-Test für Books vs. Plants
data2 %>% 
  filter(RA01 != "white") %>% 
  t.test(sekundaerscore ~ RA01, data = ., alternative = "greater")

data2 %>% 
  filter(RA01 != "white") %>% 
  droplevels() %>% 
  cohens_d(sekundaerscore ~ RA01, paired = F, var.equal = F)

# Trustworthiness
data2 %>% 
  group_by(RA01) %>% 
  summarize(mean = mean(ZU02_01))

lm(ZU02_01 ~ RA01, data = data2) %>% 
  summary()


# Kompetenz
data2 %>% 
  group_by(RA01) %>% 
  summarize(mean = mean(ZU03_01))

lm(ZU03_01 ~ RA01, data = data2) %>% 
  summary()

res_aov <- aov(ZU03_01 ~ RA01,
               data = data2
)

summary(res_aov)


# Immersion
data2 %>% 
  rowwise() %>% 
  mutate(immersion = mean(ZU04_01, ZU04_02, ZU04_03)) %>% 
  ungroup() %>% 
  group_by(RA01) %>% 
  summarize(mean = mean(immersion))

data_immersion <- data2 %>% 
  rowwise() %>% 
  mutate(immersion = mean(ZU04_01, ZU04_02, ZU04_03)) 

lm(immersion ~ RA01, data = data_immersion) %>% 
  summary()

hist(data_immersion$immersion[data_immersion$RA01 == "plant"],
     main = "Histogramm der Immersion von Pflanzen",
     xlab = "Immersionsbetrag bei Pflanzen")


# NASA TLX Dimensionen
# Mental
data2 %>% 
  group_by(RA01) %>% 
  summarize(mean = mean(NT01_01))

lm(NT01_01 ~ RA01, data = data2) %>% 
  summary()

# Physisch
data2 %>% 
  group_by(RA01) %>% 
  summarize(mean = mean(NT01_02))
lm(NT01_02 ~ RA01, data = data2) %>% 
  summary()

# Zeitdruck
data2 %>% 
  group_by(RA01) %>% 
  summarize(mean = mean(NT01_03))
lm(NT01_03 ~ RA01, data = data2) %>% 
  summary()

# Erfolg
data2 %>% 
  group_by(RA01) %>% 
  summarize(mean = mean(NT01_04))
lm(NT01_04 ~ RA01, data = data2) %>% 
  summary()

# Konzentration
data2 %>% 
  group_by(RA01) %>% 
  summarize(mean = mean(NT01_05))
lm(NT01_05 ~ RA01, data = data2) %>% 
  summary()

# Emotional
data2 %>% 
  group_by(RA01) %>% 
  summarize(mean = mean(NT01_06))

lm(NT01_05 ~ RA01, data = data2) %>% 
  summary()

