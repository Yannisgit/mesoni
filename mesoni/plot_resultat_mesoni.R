require(tidyverse)
data = read.table("Resultats_mesoni.csv",header=T)
data %>% glimpse
data %>% select(position,sample,Afreq) %>%  glimpse
data %>% select(position,sample,Afreq) %>% ggplot() + geom_tile(aes(x=as.factor(position),y=as.factor(sample),fill=Afreq)) + theme_minimal() + scale_fill_gradient() + theme()


shared_locus =  data %>% select(position,sample,Afreq) %>% group_by(position) %>% summarize(samples = n()) %>% filter(samples==9)

shared_locus$position

varloc = data %>% group_by(position) %>% summarize(mean = mean(Afreq)) %>% filter(mean<0.99)


data %>% select(position,sample,Afreq) %>%  ggplot() + geom_tile(aes(x=as.factor(position),y=as.factor(sample),fill=Afreq)) + theme_minimal() + scale_fill_gradient() + theme()

data %>% select(position,sample,Afreq) %>% filter(position %in% shared_locus$position) %>%  ggplot() + geom_tile(aes(x=as.factor(position),y=as.factor(sample),fill=Afreq)) + theme_minimal() + scale_fill_gradient() + theme()

data %>% select(position,sample,Afreq)  %>% filter(position %in% shared_locus$position) %>% filter(position %in% varloc$position) %>%  ggplot() + geom_tile(aes(x=as.factor(position),y=as.factor(sample),fill=Afreq)) + theme_minimal() + scale_fill_gradient() + theme()

