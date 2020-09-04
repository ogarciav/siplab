\encoding{UTF-8}
\name{assimilation}
\alias{assimilation}
%- Also NEED an '\alias' for EACH other topic documented here.
\alias{assimilation_pix}
\title{
%%  ~~function to do ... ~~
Compute Assimilation Indices
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
This is the main function in \pkg{siplab} for computing assimilation indices. Optionally, it computes also a free-growing index, and/or the assimilation centroid.
}
\usage{
assimilation(plants, pixsize = 0.2, resource = 1, influence =
    gnomon_inf, infpar = NULL, asym = Inf, efficiency = flat_eff,
    effpar = NULL, plot = TRUE, afree = FALSE, centroid = FALSE)

assimilation_pix(plants, pixsize = 0.2, resource = 1, influence =
    gnomon_inf, infpar = NULL, asym = Inf, efficiency = flat_eff,
    effpar = NULL, plot = TRUE, afree = FALSE, centroid = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{plants}{
%%     ~~Describe \code{plants} here~~
A \pkg{spatstat} point pattern object (class \code{ppp}). It contains the plants coordinates, and marks with the plant size and possibly other attributes.
}
  \item{pixsize}{
%%     ~~Describe \code{pixsize} here~~
Resolution, approximate step size in the pixel grid. Default 0.2.
}
  \item{resource}{
%%     ~~Describe \code{resource} here~~
Either a pixel image (class \code{im}), or a function, or other object that can be converted to a pixel image, specifying the spatial distribution of resource availability. If an image, it should cover the \code{plants} window. It is adjusted to the \code{plants} window size and specified resolution if necessary. Default is 1, a uniform distribution with 1 unit of resource per unit area.
}
  \item{influence}{
%%     ~~Describe \code{influence} here~~
Function for computing influence values. Must take arguments \code{(dx, dy, marks, par)}, where \code{dx} is a vector of points-to plant x-distances, \code{dy} is a vector of points-to plant y-distances, \code{marks} are the plant marks, and \code{par} receives the value of the \code{infpar} argument. Examples are provided in the functions \code{\link{tass_inf}()}, etc. (see \link{influence}). Default: \code{\link{gnomon_inf}}.
}
  \item{infpar}{
%%     ~~Describe \code{infpar} here~~
Parameter(s) for \code{influence}, a list or vector. Default: \code{list(a=1, b=4, smark=1)}. Here \code{smark=1} indicates that the plant size variable is the first or only item in \code{marks}.
}
  \item{asym}{
%%     ~~Describe \code{asym} here~~
Asymmetry parameter \eqn{\alpha} in the allotment function. Default is \code{Inf}, which corresponds to one-sided competition (tesselation models). In old versions of \pkg{siplab} this parameter was called \code{partpar}.
}
  \item{efficiency}{
%%     ~~Describe \code{efficiency} here~~
Efficiency function for weighting the point-wise resource uptake. Must take arguments \code{(dx, dy, marks)} or \code{(dx, dy, marks, par)}, where \code{dx} is a vector of points-to plant x-distances, \code{dy} is a vector of points-to plant y-distances, \code{marks} are the plant marks, and \code{par} receives the value of the \code{effpar} argument if not \code{NULL}. Examples are provided in the functions \code{\link{tass_eff}()}, etc. (see \link{efficiency}). The default is \code{\link{flat_eff}}, no weighting.
}
  \item{effpar}{
%%     ~~Describe \code{effpar} here~~
Parameter(s) for \code{efficiency}, usually a list or vector. Default: \code{NULL}.
}
  \item{plot}{
%%     ~~Describe \code{plot} here~~
If \code{TRUE}, the denominator of the allotment function is graphed as a pixel image, to visualize competition pressure (default).
}
  \item{afree}{
%%     ~~Describe \code{afree} here~~
If \code{TRUE}, the free-growing assimilation is also computed. Default is \code{FALSE}.
}
  \item{centroid}{
%%     ~~Describe \code{centroid} here~~
If \code{TRUE}, the centroid of the plant assimilation distribution is also computed. Default is \code{FALSE}.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
\code{assimilation()} and \code{assimilation_pix()} are functionally equivalent, but the code in \code{assimilation_pix()} is somewhat clearer and slower. It may be useful for documentation purposes, and as a basis for user modification.

Computation starts with a resource intensity map at a spatial resolution given by \code{pixsize}. Typically the resource distribution is assumed to be uniform (the default). Plants exert competitive pressure depending on size and distance, described by the \code{\link{influence}} function. The resource available at each pixel is allotted to plants according to their influence and to an allotment rule parametrized by \code{asym}. Finally, the resource uptake is weighted by the \code{\link{efficiency}} function, and is spatially integrated to obtain the plant's assimilation index. Besides size, influence and efficiency functions can include other plant attributes, such as species.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Returns the input point pattern \code{plants}, with the marks replaced by a data frame containing the original marks followed by one or more columns containing the computed results. The additional column are the assimilation indices in column \code{aindex}, and optionally the free-growing index in \code{afree}, and/or the x and y centroid coordinates in \code{cx} and \code{cy}. 
}
\references{
%% ~put references to the literature/web site here ~
\url{https://github.com/ogarciav/siplab}.

\enc{García}{Garcia}, O. (2013) \dQuote{A generic approach to spatial individual-based modelling and simulation of plant communities}. Mathematical and Computational Forestry and Nat.-Res. Sci. (MCFNS) 6(1), 36-47. 2014.
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
\code{\link{influence}}, \code{\link{efficiency}}, \code{\link{edges}}
}
\examples{
a <- assimilation(finpines, infpar=list(a=1, b=4,
     smark="height"), afree=TRUE)
summary(a)
system.time(assimilation_pix(finpines))
system.time(assimilation(finpines))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
