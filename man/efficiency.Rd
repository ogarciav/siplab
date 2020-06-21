\encoding{UTF-8}
\name{efficiency}
%- Also NEED an '\alias' for EACH other topic documented here.
\alias{efficiency}
\alias{flat.eff}
\alias{tass.eff}
\alias{gates.eff}
\alias{gnomon.eff}
\title{
%%  ~~function to do ... ~~
Efficiency Functions
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Compute efficiency values depending on distance and plant marks, for use in \code{\link{assimilation}}.
}
\usage{
flat.eff(dx, dy, marks)

tass.eff(dx, dy, marks, par = list(b = 3.52 * 0.975, c = 6.1,
    smark = 1))

gates.eff(dx, dy, marks, par = list(a = 1, b = 4, smark = 1))

gnomon.eff(dx, dy, marks, par = list(a = 1, b = 4, smark = 1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dx}{
%%     ~~Describe \code{dx} here~~
Vector of x-distances. Points x-coordinates minus plant x-coordinate.
}
  \item{dy}{
%%     ~~Describe \code{dy} here~~
Vector of y-distances. Points y-coordinates minus plant y-coordinate.
}
  \item{marks}{
%%     ~~Describe \code{marks} here~~
Plant mark information.
}
  \item{par}{
%%     ~~Describe \code{par} here~~
Optional vector or list of parameters.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
The values of \code{par} are passed in the argument \code{effpar} of \code{assimilation}, they are shown here as examples.

\code{smark} in \code{par} indicates the location of the plant size variable in \code{marks}. It can be a data frame column number, or a string id like "height".

\code{flat.eff} returns 1, independently of plant size or distance.

\code{tass.eff}, \code{gates.eff}, and \code{gnomon.eff} are proportional to their influence function counterparts (see \code{\link{influence}}), scaled to be 1 at the origin.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Vector of efficiency values, of length equal to the length of dx and dy.
}
\references{
%% ~put references to the literature/web site here ~
\url{http://forestgrowth.unbc.ca/siplab}

\enc{García}{Garcia}, O. \dQuote{A generic approach to spatial individual-based modelling and simulation of plant communities}. Mathematical and Computational Forestry and Nat.-Res. Sci. (MCFNS) 6(1), 36-47. 2014.
}
\author{
%%  ~~who you are~~
Oscar \enc{García}{Garcia}.
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{assimilation}}, \code{\link{influence}}
}

\examples{
# Example multi-species efficiency function (spruce/hardwoods)
multi.eff <- function (dx, dy, marks, par) {
    out <- numeric(length(dx))
    s <- marks$SPECIES == "Spruce"
    out[s] <- gnomon.eff(dx[s], dy[s], marks[s, ], par=list(a=par$aS,
        b=par$bS, smark=par$smark))
    out[!s] <- gnomon.eff(dx[!s], dy[!s], marks[!s, ], par=list(a=par$aH,
        b=par$bH, smark=par$smark)) # Hardwoods
    return(out)
}
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
