library(bold)
library(XML)
library(rentrez)
library(seqinr)
library(PrimerMiner)

setwd("/Users/staffordmaracle/Documents/PrimerMiner-0.21/Test_Data")

batch_config("config.txt")
batch_download("fish_taxa.csv", "config.txt")

fastafiles <- list.files("COI alignments (unprocessed)", full.names=T)
fastafiles_export <- paste("COI alignments (processed)", 
                           list.files("COI alignments (unprocessed)"), 
                           sep="/")

for (i in 1:length(fastafiles)){
  selectivetrim(fastafiles[i], fastafiles_export[i], 
                trimL=25, trimR =26, gaps=0.10, minsequL=100)
}



alignments <- list.files("COI alignments (processed)", full.names = T)



pdf("plot_alignments_1.pdf", height=24, width=100)
plot_alignments(alignments, 
                Order_names = gsub(".*./._(.*)_.*", "\\1", 
                                   alignments),
                start=1,
                end=400)
                
dev.off()



