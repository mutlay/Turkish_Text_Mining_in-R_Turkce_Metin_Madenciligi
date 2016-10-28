# Asagıdaki linkten uyarlanmistir:
## http://www.sthda.com/english/wiki/word-cloud-generator-in-r-one-killer-function-to-do-everything-you-need
# Package yukleme suradan esinlendi:
## http://stackoverflow.com/questions/8175912/load-multiple-packages-at-once
# Load multiple packages at once:
libs <- c("tm", "SnowballC", "wordcloud", "RColorBrewer", "RCurl", "XML")
lapply(libs, require, character.only = TRUE)

#Create a word cloud from a plain text file
source("rquery_wordcloud-TR_function.r")
res <- rquery.wordcloud("uniye_yeni_baslayanlara_tavsiyeler.txt", type ="file", lang = "turkish")

#####################################

# With wider word range:
res <- rquery.wordcloud("uniye_yeni_baslayanlara_tavsiyeler.txt", type ="file", lang = "turkish",
                      min.freq = 1,  max.words = 200)

#####################################

# RdBu color palette
res <- rquery.wordcloud("uniye_yeni_baslayanlara_tavsiyeler.txt", type ="file", lang = "turkish",
                      colorPalette = "RdBu")

#########################################

# Bar plot of the frequency for the top10
tdm <- res$tdm
freqTable <- res$freqTable
barplot(freqTable[1:10,]$freq, las = 2, 
        names.arg = freqTable[1:10,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")


####################################

# Term associations: You could also analyze the correlation (or association) between frequent terms. The R code below identifies which words are associated with “freedom” in I have a dream speech :

findAssocs(tdm, terms = "üniversite", corlimit = 0.70)


