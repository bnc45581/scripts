library(ggplot2)

setwd("~/set/working/path")

# LOAD PHENOTYPE DATA
ind <- read.table("~/path/to/ind/file.txt", header = FALSE, 
                  col.names = c("ID","Sex", "Clade"))
head(ind)

# LOAD DATA WITH OUTLIERS
# WITH OUTLIERS
data <- read.table("~/path/to/evec/file.evec", 
                   col.names = c("ID","PC1","PC2","PC3","PC4","PC5","PC6","PC7","PC8","PC9","PC10","Clade"))
head(data)

eval <- read.table("~/path/to/eval/file.eval")
head(eval)


## GET PERCENTS FOR PLOT BASED ON FIRST 10 PCS
eval1.10 <- eval[1:10, ]
sum1 <- sum(eval1.10)

decimal = c(eval$V1/sum1)

eval.decimal <- cbind(eval, decimal)

percents = c(eval.decimal$decimal*100)

eval.percents <- cbind(eval.decimal, percents)
head(eval.percents)

percent = subset(eval.percents, select = -c(1,2) )


# MERGE FILES
merged <- merge(data,ind, by = "ID")
head(merged)

# VISUALIZE PCA

# EDUARDO'S CODE
#PC1xPC2 <- ggplot(data) +
 # geom_point(aes(x = PC1, y = PC2, color=lineage, label = lineage, shape = lineage), size = 1) + 
  #scale_color_manual(values = cladecolors) +
  #xlab(paste("PC1", " (", round(eval[1,],digits = 2), "%)", sep = ""))+
  #ylab(paste("PC2", " (", round(eval[2,],digits = 2), "%)", sep = ""))+
  #theme_bw()+
  #theme(panel.grid = element_blank(),
  #      axis.title = element_text(size = 12),
   #     axis.text = element_text(size = 8),
    #    legend.position = 'none')


#assign clade colors

darkred <- "#8B0000"
red <- "#FF0000"
darksalmon <- "#E9967A"
darkorange <- "#FF8C00"
darkgolden <- "#FF8C00"
darkkhaki <- "#BDB76B"
olive <- "#808000"
yellow <- "#ffed6f"
lightyellow <- "#ffff99"
darkgreen <- "#006400"
forestgreen <- "#228B22"
palegreen <- "#98FB98"
mediumgreen <- "#3CB371"
darkgray <- "#2F4F4F"
teal <- "#008080"
aqua <- "#00FFFF"
darkblue <- "#00008B"
blue <- "#0000FF"
lightblue <- "#00BFFF"
darkviolet <- "#9400D3"
indigo <- "#4B0082"
purple <- "#800080"
lightpink <- "#EE82EE"
mediumpink <- "#C71585"
pink <- "#FF1493"
brown <- "#8B4513"
tan <- "#D2B48C"
black <- "#000000"

cladecolors <- c(red, black, lightblue, yellow)


# MY VERSION OF THE CODE

PC1xPC2 <- ggplot(merged) +
  geom_point(aes(x = PC1, y = PC2, color=Clade.y), size = 1) + 
  scale_color_manual(values = cladecolors) +
  xlab(paste("PC1", " (", round(percent[1,],digits = 2), "%)", sep = ""))+
  ylab(paste("PC2", " (", round(percent[2,],digits = 2), "%)", sep = ""))
PC1xPC2

pdf(file="~/path/to/output/plots/PC1vPC2.pdf")
PC1xPC2
dev.off()

PC2xPC3 <- ggplot(merged) +
  geom_point(aes(x = PC2, y = PC3, color=Clade.y), size = 1) + 
  scale_color_manual(values = cladecolors) +
  xlab(paste("PC2", " (", round(percent[2,],digits = 2), "%)", sep = ""))+
  ylab(paste("PC3", " (", round(percent[3,],digits = 2), "%)", sep = ""))
PC2xPC3

pdf(file="~/path/to/output/plots/PC2vPC3.pdf")
PC2xPC3
dev.off()

PC3xPC4 <- ggplot(merged) +
  geom_point(aes(x = PC3, y = PC4, color=Clade.y), size = 1) + 
  scale_color_manual(values = cladecolors) +
  xlab(paste("PC3", " (", round(percent[3,],digits = 2), "%)", sep = ""))+
  ylab(paste("PC4", " (", round(percent[4,],digits = 2), "%)", sep = ""))
PC3xPC4

pdf(file="~/path/to/output/plots/PC3vPC4.pdf")
PC3xPC4
dev.off()

PC4xPC5 <- ggplot(merged) +
  geom_point(aes(x = PC4, y = PC5, color=Clade.y), size = 1) + 
  scale_color_manual(values = cladecolors) +
  xlab(paste("PC4", " (", round(percent[4,],digits = 2), "%)", sep = ""))+
  ylab(paste("PC5", " (", round(percent[5,],digits = 2), "%)", sep = ""))
PC4xPC5

pdf(file="~/path/to/output/plots/PC4vPC5.pdf")
PC4xPC5
dev.off()

PC5xPC6 <- ggplot(merged) +
  geom_point(aes(x = PC5, y = PC6, color=Clade.y), size = 1) + 
  scale_color_manual(values = cladecolors) +
  xlab(paste("PC5", " (", round(percent[5,],digits = 2), "%)", sep = ""))+
  ylab(paste("PC6", " (", round(percent[6,],digits = 2), "%)", sep = ""))
PC5xPC6

pdf(file="~/path/to/output/plots/PC5vPC6.pdf")
PC5xPC6
dev.off()

PC6xPC7 <- ggplot(merged) +
  geom_point(aes(x = PC6, y = PC7, color=Clade.y), size = 1) + 
  scale_color_manual(values = cladecolors) +
  xlab(paste("PC6", " (", round(percent[6,],digits = 2), "%)", sep = ""))+
  ylab(paste("PC7", " (", round(percent[7,],digits = 2), "%)", sep = ""))
PC6xPC7

pdf(file="~/path/to/output/plots/PC6vPC7.pdf")
PC6xPC7
dev.off()

PC7xPC8 <- ggplot(merged) +
  geom_point(aes(x = PC7, y = PC8, color=Clade.y), size = 1) + 
  scale_color_manual(values = cladecolors) +
  xlab(paste("PC7", " (", round(percent[7,],digits = 2), "%)", sep = ""))+
  ylab(paste("PC8", " (", round(percent[8,],digits = 2), "%)", sep = ""))
PC7xPC8

pdf(file="~/path/to/output/plots/PC7vPC8.pdf")
PC7xPC8
dev.off()

PC8xPC9 <- ggplot(merged) +
  geom_point(aes(x = PC8, y = PC9, color=Clade.y), size = 1) + 
  scale_color_manual(values = cladecolors) +
  xlab(paste("PC8", " (", round(percent[8,],digits = 2), "%)", sep = ""))+
  ylab(paste("PC9", " (", round(percent[9,],digits = 2), "%)", sep = ""))
PC8xPC9

pdf(file="~/path/to/output/plots/PC8vPC9.pdf")
PC8xPC9
dev.off()

PC9xPC10 <- ggplot(merged) +
  geom_point(aes(x = PC9, y = PC10, color=Clade.y), size = 1) + 
  scale_color_manual(values = cladecolors) +
  xlab(paste("PC9", " (", round(percent[9,],digits = 2), "%)", sep = ""))+
  ylab(paste("PC10", " (", round(percent[10,],digits = 2), "%)", sep = ""))
PC9xPC10

pdf(file="~/path/to/output/plots/PC9vPC10.pdf")
PC9xPC10
dev.off()
