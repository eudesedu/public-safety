source("~/github/public-safety/r/all-scripts/mod-data-analysis.R")

# Descreve o modelo baseado em árvore de decisão.

model_lite <- rpart(arrest ~ beat + district, method = "class", d_crime_lite)
printcp(model_lite) 
summary(model_lite)  
