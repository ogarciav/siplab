\encoding{UTF-8}
\name{siplab-package}
\alias{siplab-package}
\alias{siplab}
\docType{package}
\title{
Spatial Individual-Plant Simulation
}
\description{
A platform for experimenting with spatially explicit individual-based plant modelling
}
\details{
\tabular{ll}{
Package: \tab siplab\cr
Type: \tab Package\cr
Version: \tab 1.5\cr
License: \tab GPL\cr
}
%~~ An overview of how to use the package, including the most important functions ~~
The main top level functions are \code{\link{pairwise}()}, and \code{\link{assimilation}()}.


\code{\link{pairwise}()} computes the competition indices most commonly used in individual-tree distance-dependent (or spatially explicit) forest growth models. These indices are based on a sum of functions of size and distance between the subject plant and each of its competitors. They represent an aggregate of pairwise interactions, the angular configuration of competitors and any higher-order interactions are ignored. Each index is characterized by a specific interaction function, here called a \link{kernel}, and by a definition of competitors.

\code{\link{assimilation}()} deals with \dQuote{fully spatial} models, computing \dQuote{assimilation indices} that aim at a mechanistic approximation of effective resource capture. One starts with a spatial resource distribution that is typically assumed to be uniform, Plants exert competitive pressure depending on size and distance, described by \link{influence} functions. The resource available at each point is allocated to plants according to their local influence and to a partition rule. Finally, the resource uptake may be weighted by an \link{efficiency} function that depends on size and distance, and is spatially integrated to obtain the plant's assimilation index.
Several examples of influence and efficiency functions are pre-programmed, and others can be easily produced.

The \code{\link{edges}()} function is useful for handling edge effects.

Some sample data sets are included, see links below.
 
The package is built on top of the \pkg{spatstat} library (\url{http://spatstat.org/}), which needs to be installed first.
}
\author{
Oscar \enc{García}{Garcia}

Maintainer: O. Garcia <garcia@dasometrics.net>
%~~ The author and/or maintainer of the package ~~
}
\references{
%~~ Literature or other references for background information ~~
\enc{García}{Garcia}, O. \dQuote{Siplab, a spatial individual-based plant modelling system}. Computational Ecology and Software 4(4), 215-222. 2014.
(\url{http://www.iaees.org/publications/journals/ces/articles/2014-4(4)/2014-4(4).asp}).
% https://www.researchgate.net/publication/267695426

\enc{García}{Garcia}, O. \dQuote{A generic approach to spatial individual-based modelling and simulation of plant communities}. Mathematical and Computational Forestry and Nat.-Res. Sci. (MCFNS) 6(1), 36-47. 2014.
(\url{http://mcfns.net/index.php/Journal/article/view/6_36}).

\url{https://github.com/ogarciav/siplab}.

\url{http://forestgrowth.unbc.ca/siplab/} (no longer maintained).
}
%~~ Optionally other standard keywords, one per line, from file KEYWORDS in the R documentation directory ~~
%\keyword{ package }
\seealso{
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
Example \pkg{siplab} data sets: \code{\link{boreasNP}}, \code{\link{boreasNS}}, \code{\link{boreasSA}}, \code{\link{boreasSP}}.

Some \pkg{spatstat} standard data sets may also be of interest: \code{finpines}, \code{longleaf}, \code{spruces}, \code{waka}.

For tutorials try the vignettes. E. g., in R type \code{help.start()} to open the help browser, and navigate to Packages > siplab > Vignettes.
}
\examples{
%~~ simple examples of the most important functions ~~
# Pretend that the data is given as a simple data frame
data <- as.data.frame(spruces) #  from a spatstat data set
head(data) # x-y coordinates in a 56x38 m plot, marks are dbh in meters
data$marks = data$marks * 100  # dbh in cm
# Convert to a point pattern object
datap <- as.ppp(data, c(0, 56, 0, 38))  # plot limits (minx, maxx, miny, maxy)
# or datap <- ppp(data$x, data$y, c(0, 56), c(0, 38), marks = data$marks)
# Hegyi (1974) index (as usual without his original 1-foot distance offset)
hegyi <- pairwise(datap, maxR = 6, kernel = powers_ker, kerpar = list(pi=1,
    pj=1, pr=1, smark=1))
head(marks(hegyi))
# ZOI model
zoi <- assimilation(datap, influence=zoi_inf, infpar=c(k=0.2, smark=1),
    asym=1)
}
