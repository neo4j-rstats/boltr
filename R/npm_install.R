#' Install boltr npm dependencies
#'
#' @inheritParams cordes::cordes_npm_install
#'
#' @importFrom cordes cordes_npm_install
#' @return
#' @export
#'
#' @examples
boltr_npm_install <- function(
  package = "boltr",
  force = FALSE
){
  cordes_npm_install(package = package, force = force)
}
