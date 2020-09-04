\encoding{UTF-8}
\name{edges}
\alias{edges}
\alias{core}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Adjust for Edge Effects
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Shrink a point pattern, or expand it through replication.
}
\usage{
edges(plants, width)

core(plants, distance)

}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{plants}{
%%     ~~Describe \code{plants} here~~
A \pkg{spatstat} point pattern object (class \code{ppp}). It normally contains the plants coordinates, and marks with the plant size and possibly other attributes.
}
  \item{width}{
%%     ~~Describe \code{width} here~~
Distance from the edges to shrink, if negative, or to expand, if positive.
}
  \item{distance}{
%%     ~~Describe \code{distance} here~~
Distance from the edges.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
When computing assimilation or competition indices, those near the edges of the study region are distorted because the outside is empty. Common solutions to this problem are not to use indices computed for plants near the edges, or (with rectangular regions) to attach translated copies, thus changing the topology intothat of a torus. This function implements both strategies. When expanding, the extentt of the copies to be used can be specified to avoid unnecessary computation.

Typically, in the first case the indices are computed for the full pattern, and then the edges are discarded using \code{edges()} with a negative \code{width}. In the second case, the point pattern is first expanded with \code{edges(plants, width)}, the indices are computed for the expanded pattern, and then the resulta are restricted to the original size with \code{edges(result, -width)}. 

\code{core()} returns a logical vector indicating which plants are at more than the given distance from the edges. Thus, \code{plants[core(plants, width)]} is equivalent to \code{edges(plants, -width)}.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
\code{edges()} returns a point pattern with the same structure as \code{plants}.

If \code{width} is negative, the parts of the pattern that are at a distance less than \code{-width} from an edge are discarded.

If \code{width} is positive, the pattern is first expanded by surrounding it with 8 shifted copies (the window must be rectangular). Then, the parts of the pattern that are at a distance greater than \code{width} from an edge of the original pattern are discarded.

If \code{width} = 0, \code{plants} is returned unchanged.

\code{core()} returns a logical vector with \code{TRUE} for the plants that are at more than the given distance from the edges, and \code{FALSE} for the rest.
}
\references{
%% ~put references to the literature/web site here ~
\url{https://github.com/ogarciav/siplab}
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
\code{\link{assimilation}}, \code{\link{pairwise}}
}
\examples{
finpines
edges(finpines, 3)
edges(finpines, -3)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
