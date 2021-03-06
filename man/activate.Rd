% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/activate.R
\name{activate}
\alias{activate}
\alias{active}
\alias{active<-}
\alias{activate.tidync}
\alias{active.tidync}
\alias{active.default}
\alias{active<-.default}
\title{Activate a NetCDF grid}
\usage{
activate(.data, what, ..., select_var = NULL)

\method{activate}{tidync}(.data, what, ..., select_var = NULL)

\method{active}{tidync}(x)

active(x)

\method{active}{default}(x)

active(x) <- value

\method{active}{default}(x) <- value
}
\arguments{
\item{.data}{NetCDF object}

\item{what}{name of a grid or variable}

\item{...}{reserved, currently ignored}

\item{select_var}{optional argument to set selected state of variable/s by
name}

\item{x}{NetCDF object}

\item{value}{name of grid or variable to be active}
}
\value{
NetCDF object
}
\description{
A grid in NetCDF is a particular shape and size available for array
variables, and consists of sets of dimensions. To activate a grid is to set
the context for downstream operations, for querying, summarizing and reading
data. There's no sense in performing these operations on more than one grid
at a time, but multiple variables may exist in a single grid. There may be
only one significant grid in a source or many, individual dimensions are
themselves grids.
}
\details{
There may be more than one grid and one is always activated by default. A
grid may be activated by name in the form of 'D1,D0' where one or more
numbered dimensions indicates the grid. The grid definition names are printed
as part of the summary of in the tidync object and may be obtained directly
with \code{\link[=hyper_grids]{hyper_grids()}} on the tidync object.

Activation of a grid sets the context for downstream operations (slicing and
reading data) from NetCDF, and as there may be several grids in a single
source activation allows a different choice of available variables.  By
default the largest grid is activated. Once activated, all downstream tasks
apply to the set of variables that exist on that grid.

If \code{\link[=activate]{activate()}} is called with a variable name, it puts the variable first.
The function \code{\link[=active]{active()}} gets and sets the active grid. To restrict ultimate
read to particular variables use the \code{select_var} argument to
\code{\link[=hyper_filter]{hyper_filter()}}, \code{\link[=hyper_tibble]{hyper_tibble()}} and \code{\link[=hyper_tbl_cube]{hyper_tbl_cube()}}.

Scalar variables are not currently available to tidync, and it's not obvious
how activation would occur for scalars, but in future perhaps \code{activate("S")}
could be the right way forward.
}
\examples{
if (!tolower(Sys.info()[["sysname"]]) == "sunos") {
 l3file <- "S20080012008031.L3m_MO_CHL_chlor_a_9km.nc"
 rnc <- tidync(system.file("extdata", "oceandata", l3file,
 package = "tidync"))
 activate(rnc, "palette")

 ## extract available grid names
 hyper_grids(rnc)
}
}
\seealso{
hyper_filter hyper_tibble hyper_tbl_cube
}
