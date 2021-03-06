% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/s3methods.R
\name{print.multiMatch}
\alias{print.multiMatch}
\title{Prints a summary of the estimates from a multiMatch object}
\usage{
\method{print}{multiMatch}(x, ...)
}
\arguments{
\item{x}{object of class "multiMatch"}

\item{...}{dots}
}
\description{
Prints a summary of the estimates from a multiMatch object
}
\examples{

  sim_data <- multilevelMatching::simulated_data
  Y <- sim_data$outcome
  W <- sim_data$treatment
  X <- as.matrix(sim_data[ ,-(1:2)])
  names(Y) <- paste0("ID", 1:length(Y))

  trimming <- FALSE
  method <- c("covariates", "polr", "multinom")[2]

  fit <- multiMatch(Y,W,X,trimming=trimming,match_on=method)
  print(fit)

}
