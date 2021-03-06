% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multiMatch.R
\name{multiMatch}
\alias{multiMatch}
\title{Matching Estimators for Multiple Treatments from Yang et al. (2016).}
\usage{
multiMatch(Y, W, X, trimming = NULL, match_on,
  model_options = list(reference_level = sort(W)[1]), M_matches = 1,
  J_var_matches = 1)
}
\arguments{
\item{Y}{A response vector (1 x n)}

\item{W}{A treatment vector (1 x n) with numerical values indicating
treatment groups}

\item{X}{A covariate matrix (p x n) with no intercept. When
match_on="existing", then X must be a vector (1 x n) of user-specified
propensity scores.}

\item{trimming}{an indicator of whether trimming the sample to ensure overlap}

\item{match_on}{User specifies "covariates" to match on raw covariates, or
"existing" to match on user-supplied propensity score values, or "polr" or
"multinom" to fit a propensity score model.}

\item{model_options}{A list of the options to pass to propensity model.
Currently under development. Can only pass reference level to multinomial
logistic regression.}

\item{M_matches}{Number of matches per unit for imputing potential outcomes,
as in Abadie and Imbens (2006).}

\item{J_var_matches}{Number of matches when estimating \eqn{\sigma^2(X,W)} as
in Abadie and Imbens (2006).}
}
\value{
A list of output from \code{estimateTau}, including at most: \itemize{

  \item \code{tauestimate}:  a vector of estimates for pairwise treatment
  effects

  \item \code{varestimate}:  a vector of variance estimates for tauestimate,
  using Abadie and Imbens (2006)'s method

  \item \code{varestimateAI2016}:  a vector of variance estimates for
  tauestimate, when matching on the generalized propensity score, using
  Abadie & Imbens (2016)'s method. This variance estimate takes into account
  of the uncertainty in estimating the GPS.

  \item \code{analysis_idx}: a list containing the indices_kept (analyzed)
  and indices_dropped (trimmed) based on Crump et al. (2009)'s method.

  }
}
\description{
This function carries out matching on covariates or on propensity scores, and
is similar to the 'legacy' functions \code{\link{multilevelMatchX}} and
\code{\link{multilevelGPSMatch}}.
}
\examples{
  sim_data <- multilevelMatching::simulated_data
  Y <- sim_data$outcome
  W <- sim_data$treatment
  X <- as.matrix(sim_data[ ,-(1:2)])
  names(Y) <- paste0("ID", 1:length(Y))

  trimming <- FALSE
  method <- c("covariates", "polr", "multinom")[2]

  multiMatch(Y,W,X,trimming=trimming,match_on=method)


}
\references{
Yang, S., Imbens G. W., Cui, Z., Faries, D. E., & Kadziola, Z.
  (2016) Propensity Score Matching and Subclassification in Observational
  Studies with Multi-Level Treatments. Biometrics, 72, 1055-1065.
  \url{https://doi.org/10.1111/biom.12505}

  Abadie, A., & Imbens, G. W. (2006). Large sample properties of matching
  estimators for average treatment effects. econometrica, 74(1), 235-267.
  \url{https://doi.org/10.1111/j.1468-0262.2006.00655.x}

  Abadie, A., & Imbens, G. W. (2016). Matching on the estimated propensity
  score. Econometrica, 84(2), 781-807.
  \url{https://doi.org/10.3982/ECTA11293}

  Crump, R. K., Hotz, V. J., Imbens, G. W., & Mitnik, O. A. (2009). Dealing
  with limited overlap in estimation of average treatment effects.
  Biometrika, 96(1), 187-199. \url{https://doi.org/10.1093/biomet/asn055}
}
\seealso{
\code{\link{multilevelMatchX}}; \code{\link{multilevelGPSMatch}}
}
