source("~/github/public-safety/r/all-scripts/mod-extract.R")

# Realiza a leitura da base de dados.
#' 
#' @param s_crime, recebe o nome do arquivo *.rda da base de dados que será carregada.
#'  
#' @export

f_load_dataset_crimes <- function(s_dataset_path, s_crime){
  setwd(s_dataset_path)
  load(file = s_crime)
  d_crime_full
}

# Esta função processa a base de dados conectando-se via RSocrata e retorna os registros mais atualizados. 
# Ao gerar esta base, será necessário intenso processamento computacional, desta forma, para o estudo em questão, 
# a chamada desta função foi realizada apenas uma vez. 

# f_load_dataset_crimes_full(s_config$chicago_crimes$dataset_crimes_url,
#                            s_config$chicago_crimes$dataset_path,
#                            s_config$chicago_crimes$app_token,
#                            s_config$chicago_crimes$email,
#                            s_config$chicago_crimes$password)

# Realiza a leitura da base de dados reduzida.
#' 
#' @param s_crime_lite, recebe o nome do arquivo *.rda da base de dados que será carregada.
#'  
#' @export

f_load_dataset_crimes_lite <- function(s_dataset_path, s_crime_lite){
  setwd(s_dataset_path)
  load(file = s_crime_lite)
  d_crime_lite
}
