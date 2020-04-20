source("~/github/public-safety/r/all-scripts/mod-packages.R")

# Realiza a conexão com a API via RSocrata (https://opendata.socrata.com/login) para extrair a base de dados.
#' 
#' @param s_url_json, recebe o endereço da url.
#' @param s_dataset_path, define o diretório.
#' @param s_app_token, define o token gerado.
#' @param s_email, define o email.
#' @param s_password, define a senha.
#'  
#' @export

f_load_dataset_crimes_full <- function(s_url_json, s_dataset_path, s_app_token, s_email, s_password){
  d_crime_full <- read.socrata(s_url_json, s_app_token, s_email, s_password)
  setwd(s_dataset_path)
  save(d_crime_full, file = "dataset_crimes_full.rda")
  drive_upload("dataset_crimes_full.rda", overwrite = TRUE)
}

# Cria uma base de dados reduzida com 1000 observações a partir de uma url pública (formato *.json).
#' 
#' @param s_url_json, recebe o endereço da url.
#' @param s_dataset_path, define o diretório da base de dados.
#' @param s_crime_lite, recebe o nome do arquivo *.rda que será criado.
#'  
#' @export

f_create_dataset_crimes_lite <- function(s_url_json, s_dataset_path, s_crime_lite){
  d_crime_lite <- fromJSON(s_url_json, flatten = TRUE)
  setwd(s_dataset_path)
  save(d_crime_lite, file = s_crime_lite)
}

# Cria, em um diretório, a base de dados resumida.

f_create_dataset_crimes_lite(s_config$chicago_crimes$crimes_url, 
                             s_config$chicago_crimes$dataset_path, 
                             s_config$chicago_crimes$dataset_crimes_lite)
