#' Run boltr Node Script
#'
#' @return
#' @export
#'
#' @importFrom cordes cordes_run
#'
#' @examples
boltr_run <- function(url, user, password, cypher){
  res <- cordes_run(
    package = "boltr",
    file = "app.js",
    extra_args = c(url, user, password, cypher)
  )
  if (res$status == 0){
    res$stdout
  } else {
    stop(res$stderr)
  }

}
