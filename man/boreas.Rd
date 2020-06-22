\encoding{UTF-8}
\name{boreas}
\alias{boreasNP}
\alias{boreasNS}
\alias{boreasSA}
\alias{boreasSP}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
Marked Point Pattern Tree Data from BOREAS
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
Four data sets from the Boreal Ecosystem–Atmosphere Study (BOREAS, Rich and Fournier 1999), as used by García (2006). These are approximately evenaged and single-species unmanaged natural forests, from a northern study area in Manitoba and a southern study area in Saskatchewan,  central Canada. Tree coordinates and diameters at breast height (dbh) were measured for all trees taller than 2 m on areas of 50 m \eqn{\times}{x} 60 m, subdivided into subplots on a 10 m grid. Tree heights were estimated from height-dbh regressions based on a sample of height measurements. The data here excludes dead trees, and also excludes some trees with coordinates just outside the observation window.

The 4 data sets are:
\describe{
\item{\code{boreasNP}:}{Northern study area, Jack pine}
\item{\code{boreasNS}:}{Northern study area, black spruce}
\item{\code{boreasSA}:}{Southern study area, trembling aspen}
\item{\code{boreasSP}:}{Southern study area, Jack pine}
}
}
%\usage{data(boreasNP)}
\format{
Each data set is a \pkg{spatstat} marked point pattern object (class \code{ppp}). The marks are a data frame with \code{dbh} (cm), \code{height} (m), \code{species}, a \code{dominance} classification, and a subplot id.
}
%\details{
%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
\url{https://doi.org/10.3334/ORNLDAAC/359}
}
\references{
%%  ~~ possibly secondary sources and usages ~~
Rich, P.M., and Fournier, R. (1999) BOREAS TE-23 map plot
data [online]. Oak Ridge National Laboratory Distributed Active
Archive Center, Oak Ridge, Tennessee. Available from
\url{http://daac.ornl.gov}.

\enc{García}{Garcia}, O. (2006) Scale and spatial structure effects on tree size distributions: Implications for growth and yield modelling. \emph{Canadian Journal of Forest Research} \bold{36}(11), 2983--2993. \url{https://www.researchgate.net/publication/237866519}.
}
\examples{
summary(boreasNP)
plot(boreasNP)
\dontrun{aNP <- assimilation(boreasNP)}
# this may take a few minutes!
}
\keyword{datasets}
