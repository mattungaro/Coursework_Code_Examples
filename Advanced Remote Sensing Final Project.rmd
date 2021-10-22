---
title: "577_means"
author: "Matthew Ungaro"
date: "4/29/2021"
output: html_document
---


```{r}
library(tidyverse)
means <- read_csv("C:\\Users\\Owner\\Documents\\UNC\\UNC_SPRING2021\\Adv_RS\\updated_remote_sensing_project\\final_project_means.csv")

means %>% ggplot(mapping = aes(restored_or_nat, mean))+geom_boxplot()
means_wo_buf <- means %>% filter(buffer == F)
means_only_buff <- means %>% filter(buffer == T)


means_wo_buf %>% ggplot(mapping = aes(date1, mean, fill = restored_or_nat))+geom_boxplot()+xlab("Month")+
  ggthemes::theme_few() +theme(legend.title = element_text( size = 18, face = "bold"),
  legend.text = element_text(size = 16), plot.title = element_text(size=20, face="bold.italic"),
          axis.title.x = element_text(size=20, face="bold"),
          axis.title.y = element_text(size=20, face="bold"), axis.text=element_text(size=18))+ labs(fill = "Type")+ggthemes::scale_fill_tableau()


means_only_buff %>% ggplot(mapping = aes(date1, mean, fill = restored_or_nat))+geom_boxplot()+xlab("Month (2018-2019)")+
  ggthemes::theme_few() +theme(legend.title = element_text( size = 18, face = "bold"),
  legend.text = element_text(size = 16), plot.title = element_text(size=20, face="bold.italic"),
          axis.title.x = element_text(size=20, face="bold"),
          axis.title.y = element_text(size=20, face="bold"), axis.text=element_text(size=18))+ labs(fill = "Type")+ggthemes::scale_fill_tableau("Classic Purple-Gray 6")

```
# let's do this across time and without buffers.
```{r}
march_m <- means %>% filter(month2 == "March" & buffer == F)
dec_m <- means %>% filter(month2 == "December"& buffer == F)
may_m <- means %>% filter(month2=="May"& buffer == F)
march_m %>% ggplot(mapping = aes(restored_or_nat, mean))+geom_boxplot()+ggtitle("March Means")
may_m %>% ggplot(mapping = aes(restored_or_nat, mean))+geom_boxplot()+ggtitle("May Means")
dec_m %>% ggplot(mapping = aes(restored_or_nat, mean))+geom_boxplot()+ggtitle("Dec Means")


```
# let's graph temperature and size...

```{r}
march_m <- means %>% filter(month2 == "March" & buffer == F)
dec_m <- means %>% filter(month2 == "December"& buffer == F)
may_m <- means %>% filter(month2=="May"& buffer == F)
march_m %>% ggplot(mapping = aes(sq_km_site, mean, color = restored_or_nat))+geom_point()+geom_line()
may_m %>% ggplot(mapping = aes(sq_km_site, mean, color = restored_or_nat))+geom_point()+geom_line()
dec_m%>% ggplot(mapping = aes(sq_km_site, mean, color = restored_or_nat))+geom_point()+geom_line()

march_test <- means %>% filter(month2 == "March" & buffer == T)
dec_test <- means %>% filter(month2 == "December"& buffer == T)
may_test <- means %>% filter(month2=="May"& buffer == T)
march_test %>% ggplot(mapping = aes(sq_km_site, mean, color = restored_or_nat))+geom_point()+geom_line()
dec_test %>% ggplot(mapping = aes(sq_km_site, mean, color = restored_or_nat))+geom_point()+geom_line()
may_test %>% ggplot(mapping = aes(sq_km_site, mean, color = restored_or_nat))+geom_point()+geom_line()
```
# let's regress size by mean...

```{r}
dec_m%>% ggplot(mapping = aes(sq_km_site, mean, color = restored_or_nat))+geom_point()+geom_smooth(method = "lm")
dec_m%>% ggplot(mapping = aes(sq_km_site, mean))+geom_point()+geom_smooth(method = "lm")
# size does have an effect, though with 12 points, it doesn't seem to be a large one

dec_test %>% ggplot(mapping = aes(sq_km_site, mean, color = restored_or_nat))+geom_point()+geom_smooth(method = "lm")

dec_test %>% ggplot(mapping = aes(sq_km_site, mean))+geom_point()+geom_smooth(method = "lm")
```

```{r}
library(gridExtra)
a = dec_m%>% ggplot(mapping = aes(sq_km_site, mean, color = restored_or_nat))+geom_point()+geom_smooth(method = "lm", se = F)+xlab("Square Kilometers")+ ylab("Mean Temperature (Dec)")+labs(color = "Type")+
  ggthemes::theme_few() +theme(legend.title = element_text( size = 18, face = "bold"),
  legend.text = element_text(size = 16), plot.title = element_text(size=20, face="bold.italic"),
          axis.title.x = element_text(size=20, face="bold"),
          axis.title.y = element_text(size=20, face="bold"), axis.text=element_text(size=18))+ggthemes::scale_color_tableau()

b = march_m%>% ggplot(mapping = aes(sq_km_site, mean, color = restored_or_nat))+geom_point()+geom_smooth(method = "lm", se = F)+xlab("Square Kilometers")+ ylab("Mean Temperature (Mar)")+labs(color = "Type")+
  ggthemes::theme_few() +theme(legend.title = element_text( size = 18, face = "bold"),
  legend.text = element_text(size = 16), plot.title = element_text(size=20, face="bold.italic"),
          axis.title.x = element_text(size=20, face="bold"),
          axis.title.y = element_text(size=20, face="bold"), axis.text=element_text(size=18))+ggthemes::scale_color_tableau()
c = may_m%>% ggplot(mapping = aes(sq_km_site, mean, color = restored_or_nat))+geom_point()+geom_smooth(method = "lm", se = F)+xlab("Square Kilometers")+ ylab("Mean Temperature (May)")+labs(color = "Type")+
  ggthemes::theme_few() +theme(legend.title = element_text( size = 18, face = "bold"),
  legend.text = element_text(size = 16), plot.title = element_text(size=20, face="bold.italic"),
          axis.title.x = element_text(size=20, face="bold"),
          axis.title.y = element_text(size=20, face="bold"), axis.text=element_text(size=18))+ggthemes::scale_color_tableau()


grid.arrange(a,b,c, ncol = 3, nrow = 1) # plug into the console.

```


```{r}
library(gridExtra)
a = dec_test%>% ggplot(mapping = aes(sq_km_site, mean, color = restored_or_nat))+geom_point()+geom_smooth(method = "lm", se = F)+xlab("Square Kilometers")+ ylab("Mean Temperature (Dec)")+labs(color = "Type")+
  ggthemes::theme_few() +theme(legend.title = element_text( size = 18, face = "bold"),
  legend.text = element_text(size = 16), plot.title = element_text(size=20, face="bold.italic"),
          axis.title.x = element_text(size=20, face="bold"),
          axis.title.y = element_text(size=20, face="bold"), axis.text=element_text(size=18))+ggthemes::scale_color_tableau()

b = march_test%>% ggplot(mapping = aes(sq_km_site, mean, color = restored_or_nat))+geom_point()+geom_smooth(method = "lm", se = F)+xlab("Square Kilometers")+ ylab("Mean Temperature (Mar)")+labs(color = "Type")+
  ggthemes::theme_few() +theme(legend.title = element_text( size = 18, face = "bold"),
  legend.text = element_text(size = 16), plot.title = element_text(size=20, face="bold.italic"),
          axis.title.x = element_text(size=20, face="bold"),
          axis.title.y = element_text(size=20, face="bold"), axis.text=element_text(size=18))+ggthemes::scale_color_tableau()
c = may_test%>% ggplot(mapping = aes(sq_km_site, mean, color = restored_or_nat))+geom_point()+geom_smooth(method = "lm", se = F)+xlab("Square Kilometers")+ ylab("Mean Temperature (May)")+labs(color = "Type")+
  ggthemes::theme_few() +theme(legend.title = element_text( size = 18, face = "bold"),
  legend.text = element_text(size = 16), plot.title = element_text(size=20, face="bold.italic"),
          axis.title.x = element_text(size=20, face="bold"),
          axis.title.y = element_text(size=20, face="bold"), axis.text=element_text(size=18))+ggthemes::scale_color_tableau()


grid.arrange(a,b,c, ncol = 3, nrow = 1)

dec_test1 <- dec_test %>% filter(restored_or_nat == "restored")
dec_test2 <- dec_test %>% filter(restored_or_nat == "natural")
march_test1 <- march_test %>% filter(restored_or_nat == "restored")
march_test2 <- march_test %>% filter(restored_or_nat == "natural")
may_test1 <- may_test %>% filter(restored_or_nat == "restored")
may_test2 <- may_test %>% filter(restored_or_nat == "natural")

summary(lm(dec_test1$mean ~ dec_test1$sq_km_site)) # 0.11
summary(lm(dec_test2$mean ~ dec_test2$sq_km_site)) # 0.00
summary(lm(march_test1$mean ~ march_test1$sq_km_site)) # 0.03
summary(lm(march_test2$mean ~ march_test2$sq_km_site)) # 0.03
summary(lm(may_test1$mean ~ may_test1$sq_km_site)) # 0.07
summary(lm(may_test2$mean ~ may_test2$sq_km_site)) # 0.10
```


```{r}
test1 <- means_wo_buf %>% select(location, location2, restored_or_nat, date1, mean)
test2 <- means_only_buff%>% select(location_buff = location, location2_buff = location2, restored_buff = restored_or_nat, date1buff = date1, mean_buff = mean)
test3 <- cbind(test1,test2)
test3 <- test3 %>% mutate(fifty_m_decline = mean_buff -mean)

test3 %>% ggplot(mapping = aes(date1, fifty_m_decline, fill = restored_or_nat))+geom_boxplot()+xlab("Month (2018-2019)")+
  ggthemes::theme_few() +theme(legend.title = element_text( size = 18, face = "bold"),
  legend.text = element_text(size = 16), plot.title = element_text(size=20, face="bold.italic"),
          axis.title.x = element_text(size=20, face="bold"),
          axis.title.y = element_text(size=20, face="bold"), axis.text=element_text(size=18))+ labs(fill = "Type")+ggthemes::scale_fill_tableau("Classic 10 Light")
```

