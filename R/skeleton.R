# from https://github.com/rstudio/bookdown/blob/master/R/utils.R
gaelsdown_file <- function(...) {
  system.file(..., package = 'gaelsdown', mustWork = TRUE)
}

# from https://github.com/rstudio/bookdown/blob/master/R/skeleton.R
gaelsdown_skeleton <- function(path = getwd()) {

  # ensure directory exists
  #  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # copy 'resources' folder to path
  resources <- gaelsdown_file('rstudio', 'templates', 'project', 'resources')

  R.utils::copyDirectory(from = resources,
                         to = path,
                         recursive = TRUE)
}
