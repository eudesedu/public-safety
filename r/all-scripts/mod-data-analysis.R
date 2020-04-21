source("~/github/public-safety/r/all-scripts/mod-transform.R")

d_crime_full <- f_load_dataset_crimes(s_config$chicago_crimes$dataset_path, 
                                      s_config$chicago_crimes$dataset_crimes_full)

d_crime <- f_transform_dataset_crimes(d_crime_full)

d_crime_lite <- f_load_dataset_crimes_lite(s_config$chicago_crimes$dataset_path, 
                                           s_config$chicago_crimes$dataset_crimes_lite)

d_crime_lite <- f_transform_dataset_crimes_lite(d_crime_lite)

# Descreve a estrutura das bases de dados.

str(d_crime)

# Quantifica e destalha as latitudes e longitudes onde os crimes aconteceram de acordo com as variáveis 
# "latitude e longitude - Crime".

length(unique(d_crime$latitude))
# unique(d_crime$latitude)

length(unique(d_crime$longitude))
# unique(d_crime$longitude)

# Quantifica e descreve as ruas dos crimes de acordo com a variável "Quadra - Crime".

length(unique(d_crime$block))
# unique(d_crime$block)
head(as.data.frame(table(d_crime$block)))
tail(as.data.frame(table(d_crime$block)))

# Quantifica e descreve os locais que dos crimes de acordo com a variável "Descrição da Localidade - Crime".

length(unique(d_crime$location_description))
as.data.frame(table(d_crime$location_description))

# Quantifica e descreve a numeração das patrulhas policiais responsáveis pelos locais dos crimes de acordo com a variável 
# "Patrulha Policial - Crime".

length(unique(d_crime$beat))
unique(d_crime$beat)

# Quantifica e descreve a numeração dos distritos policiais responsáveis pelos locais dos crimes de acordo com a variável 
# "Distrito - Crime".

length(unique(d_crime$district))
unique(d_crime$district)

# Quantifica e descreve os tipos de crimes de acordo com as variáveis "Tipo Primário e Descrição - Crime".

length(unique(d_crime$primary_type))
d_primary_type_full <- as.data.frame(table(d_crime$primary_type))
d_primary_type_full <- rename(d_primary_type_full, Crimes = Var1, Quantidade = Freq)
d_primary_type_full

length(unique(d_crime$description))
as.data.frame(table(d_crime$description))

# Tabela com a soma de NAs para todas as variáveis.

na_crime_full <- sapply(d_crime, function(varibles) sum(length(which(is.na(varibles)))))
data.frame(na_crime_full)

# Remove as observações com NA.

d_na_crime_full <- na.omit(d_crime)

# Análise da correlação entre as variáveis.

cor_crime_full = cor(d_na_crime_full[c(1, 10:13)], method = c("pearson"))
cor_crime_full

# Aplicação de séries temporais - Geral.

ts_crime_over_time_full <- as.data.frame(table(d_crime$year, d_crime$month))
ts_crime_over_time_full <- ts_crime_over_time_full[with(ts_crime_over_time_full, order(Var1)), ]
ts_crime_over_time_full <- ts(ts_crime_over_time_full$Freq, frequency = 12, start = c(2001, 1))
class(ts_crime_over_time_full)
is.ts(ts_crime_over_time_full)

ts_crime_over_time_full
summary(ts_crime_over_time_full)

# Aplicação de séries temporais - Homicídios.

d_crime_homicide <- filter(d_crime, d_crime$primary_type == "HOMICIDE")

ts_crime_over_time_homicide <- as.data.frame(table(d_crime_homicide$year, d_crime_homicide$month))
ts_crime_over_time_homicide <- ts_crime_over_time_homicide[with(ts_crime_over_time_homicide, order(Var1)), ]
ts_crime_over_time_homicide <- ts(ts_crime_over_time_homicide$Freq, frequency = 12, start = c(2001, 1))
class(ts_crime_over_time_homicide)
is.ts(ts_crime_over_time_homicide)

ts_crime_over_time_homicide
summary(ts_crime_over_time_homicide)

# Quantifica e descreve o tipo de crime: "Homicídio".

length(unique(d_crime_homicide$description))
d_primary_type_homicide <- as.data.frame(table(d_crime_homicide$description, d_crime_homicide$arrest))
d_primary_type_homicide <- rename(d_primary_type_homicide, Description = Var1, Arrest = Var2)
d_primary_type_homicide

# Aplicação de séries temporais - Estupro.

d_crime_sexual <- filter(d_crime, d_crime$primary_type == "CRIM SEXUAL ASSAULT")

ts_crime_over_time_sexual <- as.data.frame(table(d_crime_sexual$year, d_crime_sexual$month))
ts_crime_over_time_sexual <- ts_crime_over_time_sexual[with(ts_crime_over_time_sexual, order(Var1)), ]
ts_crime_over_time_sexual <- ts(ts_crime_over_time_sexual$Freq, frequency = 12, start = c(2001, 1))
class(ts_crime_over_time_sexual)
is.ts(ts_crime_over_time_sexual)

ts_crime_over_time_sexual
summary(ts_crime_over_time_sexual)

# Quantifica e descreve o tipo de crime: "Estupro".

length(unique(d_crime_sexual$description))
d_primary_type_sexual <- as.data.frame(table(d_crime_sexual$description, d_crime_sexual$arrest))
d_primary_type_sexual <- rename(d_primary_type_sexual, Description = Var1, Arrest = Var2)
d_primary_type_sexual
