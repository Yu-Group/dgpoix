% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dgp-lib-y.R
\name{generate_y_linear}
\alias{generate_y_linear}
\title{Simulate linear response data.}
\usage{
generate_y_linear(
  X,
  U,
  betas = NULL,
  betas_unobs = NULL,
  intercept = 0,
  err = NULL,
  return_support = FALSE,
  ...
)
}
\arguments{
\item{X}{Design data matrix of observed variables.}

\item{U}{Design data matrix of unobserved (omitted) variables.}

\item{betas}{Coefficient vector for observed design matrix. If a scalar is provided, the coefficient vector is constant. If \code{NULL} (default), entries in the coefficient vector are drawn iid from N(0, \code{betas_sd}^2). Can also be a function that generates the coefficient vector; see \code{generate_coef()}.}

\item{betas_unobs}{Coefficient vector for unobserved design matrix. If a scalar is provided, the coefficient vector is constant. If \code{NULL} (default), entries in the coefficient vector are drawn iid from N(0, \code{betas_unobs_sd}^2). Can also be a function that generates the coefficient vector; see \code{generate_coef()}.}

\item{intercept}{Scalar intercept term.}

\item{err}{Function from which to generate simulated error vector. Default is
\code{NULL} which adds no error to the DGP.}

\item{return_support}{Logical specifying whether or not to return a vector of
the support column names. If \code{X} has no column names, then the indices
of the support are used.}

\item{...}{Additional arguments to pass to functions that generate betas, betas_unobs, and err. If the argument doesn't exist in one of the functions it is ignored. If two or more of the functions have an argument of the same name but with different values, then use one of the following prefixes in front of the argument name (passed via \code{...}) to differentiate it: .betas_, .betas_unobs_, or .err_. For additional details, see \code{generate_coef()} and \code{generate_errors()}}
}
\value{
If \code{return_support = TRUE}, returns a list of two:
\describe{
\item{y}{A response vector of length \code{nrow(X)}.}
\item{support}{A vector of feature indices indicating all features used in
the true support of the DGP.}
}

If \code{return_support = FALSE}, returns only the response vector \code{y}.
}
\description{
Generate linear response data with a specified error
distribution given the observed and unobserved design matrices.
}
\examples{
X <- generate_X_gaussian(.n = 100, .p = 2)
U <- generate_X_gaussian(.n = 100, .p = 2)

# generate the response from: y = 3*x_1 - x_2 + N(0, 1) errors
y <- generate_y_linear(X = X, betas = c(3, -1), err = rnorm)

# generate the response from: y = 3*x_1 - x_2 + u_1 + 2*u_2
y <- generate_y_linear(X = X, U = U, betas = c(3, -1), betas_unobs = c(1, 2))

}
