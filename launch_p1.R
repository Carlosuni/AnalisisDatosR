#Sys.setlocale(, 'Spanish')

# Reset de variables de entorno
rm(list=ls())
# Limpieza de consolacls
cat("\014") 
# Carga de packages
prerequisite_packages = c("rmarkdown", "shiny", "here", "parallel")
# Comprueba packages que falten por instalar para funcionar
new_packages <- prerequisite_packages[!(prerequisite_packages %in% installed.packages()[,"Package"])]
if (length(new_packages) > 0) {
  install.packages(new_packages)
}
invisible(lapply(prerequisite_packages, library, character.only = TRUE))


# num_threads <- detectCores() - 1

# Ejecucion del programa hecho con RMarkdown y Shiny
# Introduce nombre de archivo RMD principal
input_markdown_filename <- "index.Rmd"
setwd(paste0(here(), "/"))
print("Working Directory:")
getwd()
# Introduce nombre de carpeta donde está el archivo RMD principal
src_markdown_dir <- "src"

(normalizePath(input_markdown_filepath <- file.path(src_markdown_dir, input_markdown_filename)))

rmarkdown::run(file = input_markdown_filepath, dir = dirname(input_markdown_filepath), default_file = NULL,
    auto_reload = TRUE, shiny_args = NULL, render_args = NULL)
