\encoding{UTF-8}
\name{pairwise}
\alias{pairwise}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Compute Pairwise Competition Indices 
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
This function computes competition indices based on pairs of plants, ignoring higher-order interactions.
}
\usage{
pairwise(plants, maxN = NULL, maxR = NULL, select = NULL, selpar =
         NULL, kernel, kerpar = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{plants}{
%%     ~~Describe \code{plants} here~~
A \pkg{spatstat} point pattern object (class \code{ppp}). It contains the plants coordinates, and marks with the plant size and possibly other attributes.
}
  \item{maxN}{
%%     ~~Describe \code{maxN} here~~
Maximum number of nearest neighbors to include as potential competitors. Default is NULL (no restriction).
}
  \item{maxR}{
%%     ~~Describe \code{maxR} here~~
Maximum radius to search for potential competitors. Default is NULL (no restriction).
}
  \item{select}{
%%     ~~Describe \code{select} here~~
Optional user-supplied selection function for choosing competitors. Must take arguments \code{(imarks, jmarks, dists, dranks)} or \code{(imarks, jmarks, dists, dranks, par)}, where \code{imarks} are the marks for the subject plant (a 1-row data frame), \code{jmarks} is a data frame with the marks of the potential competitors, \code{dists} is a vector distances between subject plant and the potential competitors, \code{dranks} are the distance ranks, and \code{par} receives the value of the \code{selpar} argument if not \code{NULL}. It must return a logical vector with the same length as \code{dists}. Examples are provided in the functions \code{\link{powlinear_sel}()}, etc. (see \link{select}). Default is NULL (no selection).
}
  \item{selpar}{
%%     ~~Describe \code{selpar} here~~
Parameter(s) for \code{select}, usually a list or vector. Default: NULL. 
}
  \item{kernel}{
%%     ~~Describe \code{kernel} here~~
Competition kernel function for computing the effect of competitor \eqn{j} on the subject plant \eqn{i}. Must yake arguments \code{(imarks, jmarks, dists, dranks)} or \code{(imarks, jmarks, dists, dranks, par)}, where \code{imarks} are the marks for the subject plant (a 1-row data frame), \code{jmarks} is a data frame with the marks of the potential competitors, \code{dists} is a vector of distances between subject plant and the potential competitors, \code{dranks} are the distance ranks, and \code{par} receives the value of the \code{kerpar} argument if not \code{NULL}. It must return a numeric vector with the same length as \code{dists}. Examples are provided in the functions \code{\link{powers_ker}()}, etc. (see \link{kernel}).
}
  \item{kerpar}{
%%     ~~Describe \code{kerpar} here~~
Parameter(s) for \code{kernel}, usually a list or vector. Default: NULL. 
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
Traditionally, the competition index for a subject plant \eqn{i} is obtained in two stages: (1) Choose a set of competitors of \eqn{i} by some selection rule. (2) Compute a measure of the effect of each competitor \eqn{j} on plant \eqn{i}, and add over \eqn{j}. This effect of \eqn{j} on \eqn{i} is normally a function of the sizes of both plants and of the distance between them, which we call a competition kernel. The kernel may depend on other plant attributes, like species, and in some rare instances on the distance ranks or on the number of competitors. Conceptually, the first stage is not strictly necessary, it could be replaced by specifying zero kernel values (the effect of the selection is usually to truncate the kernel function beyond some distance). However, a separate selection rule may be more transparent, and may reduce the computational effort in searching for neighbors.

Some simple selection rules can be implemented by giving a value to \code{maxN} and/or \code{maxR}. In any case, reasonable limits on these variables may be advisable for reducing computation.

More complex rules can be specified by the \code{select} function, with parameters in \code{selpar}. See \code{\link{select}} for examples.  If more than one of \code{maxN},  \code{maxR} or \code{select} are given, the intersection of the selection criteria is used.

Kernel computation is specified by the \code{kernel} function and the parameters in \code{kerpar}. See \code{\link{kernel}} for examples.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Returns the input point pattern \code{plants}, with the marks replaced by a data frame containing the original marks followed by the competition index in a column named \code{cindex}. 
}
\references{
%% ~put references to the literature/web site here ~
\url{https://github.com/ogarciav/siplab}

\enc{García}{Garcia}, O. \dQuote{Siplab, a spatial individual-based plant modelling system}. Computational Ecology and Software 4(4), 215-222. 2014.
}
\author{
%%  ~~who you are~~
Oscar \enc{García}{Garcia}.
}
\note{
%%  ~~further notes~~
Requires the \pkg{spatstat} package.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{select}}, \code{\link{kernel}}, \code{\link{edges}}
}
\examples{
# Hegyi (1974) index (no distance offset, as usual)
summary(pairwise(finpines, maxR = 6, kernel=powers_ker))
}   
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
