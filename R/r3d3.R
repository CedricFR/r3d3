#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
r3d3 <- function(data, jsfile, params = NULL, width = NULL, height = NULL, elementId = NULL) {
  script = paste(readLines(jsfile), collapse="\n")

  # forward options using x
  x = list(
     message = data,
    data = data,
    params = params,
    script = script
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'r3d3',
    x,
    width = width,
    height = height,
    package = 'r3d3',
    elementId = elementId
  )
}

#' Shiny bindings for r3d3
#'
#' Output and render functions for using r3d3 within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a r3d3
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name r3d3-shiny
#'
#' @export
r3d3Output <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'r3d3', width, height, package = 'r3d3')
}

#' @rdname r3d3-shiny
#' @export
renderR3d3 <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, r3d3Output, env, quoted = TRUE)
}
