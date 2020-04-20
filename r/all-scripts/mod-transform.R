source("~/github/public-safety/r/all-scripts/mod-load.R")

# Determina as transformações da base de dados. 
#' 
#' @param d_crime, recebe a base de dados.
#'  
#' @export

f_transform_dataset_crimes <- function(d_crime){
  # Remove as variáveis desnecessárias.
  
  d_crime <- d_crime[-c(2, 5, 10, 13:16, 18)] 
  
  # Altera o tipo das variáveis e remove os espaços em brancos.
  
  d_crime$beat <- as.integer(trimws(d_crime$beat))
  d_crime$district <- as.integer(trimws(d_crime$district))
  d_crime$block <- trimws(d_crime$block)
  d_crime$primary_type <- trimws(d_crime$primary_type)
  d_crime$description <- trimws(d_crime$description)
  d_crime$location_description <- trimws(d_crime$location_description)
  d_crime$arrest <- as.factor(trimws(d_crime$arrest))
  d_crime$year <- trimws(d_crime$year)
  d_crime$month <- substring(trimws(d_crime$date), 6, 7)

  # Reorganiza as colunas.
  
  d_crime <- d_crime[c(1, 2, 10, 13, 3, 6, 4, 5, 7, 8, 9, 11, 12)]
}

# Determina as transformações da base de dados resumida. 
#' 
#' @param d_crime, recebe a base de dados.
#'  
#' @export

f_transform_dataset_crimes_lite <- function(d_crime){
  # Remove as variáveis desnecessárias.
  
  d_crime <- d_crime[-c(2, 5, 15:17, 22:32)] 
  
  # Altera o tipo das variáveis e remove os espaços em brancos.
  
  d_crime$id <- as.integer(trimws(d_crime$id))
  d_crime$beat <- as.integer(trimws(d_crime$beat))
  d_crime$district <- as.integer(trimws(d_crime$district))
  d_crime$ward <- as.integer(trimws(d_crime$ward))
  d_crime$community_area <- as.integer(trimws(d_crime$community_area))
  d_crime$year <- as.integer(trimws(d_crime$year))
  d_crime$latitude <- as.numeric(trimws(d_crime$latitude))
  d_crime$longitude <- as.numeric(trimws(d_crime$longitude))
  d_crime$time <- substring(trimws(d_crime$date), 12, 19)
  d_crime$month <- substring(trimws(d_crime$date), 6, 7)
  d_crime$month <- as.integer(d_crime$month)
  d_crime$date <- substring(trimws(d_crime$date), 0, 10)
  d_crime$date <- format(strptime(d_crime$date, "%Y-%m-%d"), "%Y%m%d")
  d_crime$date <- as.integer(d_crime$date)
  d_crime$block <- trimws(d_crime$block)
  d_crime$primary_type <- trimws(d_crime$primary_type)
  d_crime$description <- trimws(d_crime$description)
  d_crime$arrest <- as.factor(trimws(d_crime$arrest))
  d_crime$domestic <- as.factor(trimws(d_crime$domestic))
  d_crime$location_description <- trimws(d_crime$location_description)
  d_crime$updated_on <- trimws(d_crime$updated_on)
  
  # Reorganiza as colunas.
  
  d_crime <- d_crime[c(1, 13, 2, 18, 17, 14, 4, 5, 7, 8, 3, 6, 9, 10, 11, 12, 15, 16)]
}
