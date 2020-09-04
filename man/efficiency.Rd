\encoding{UTF-8}
\name{efficiency}
%- Also NEED an '\alias' for EACH other topic documented here.
\alias{efficiency}
\alias{flat_eff}
\alias{tass_eff}
\alias{gates_eff}
\alias{gnomon_eff}
\title{
%%  ~~function to do ... ~~
Efficiency Functions
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Compute efficiency values depending on distance and plant marks, for use in \code{\link{assimilation}()}.

Note: In previous versions of \pkg{siplab} the function names had
\code{.eff} in place of \code{_eff}.
}
\usage{
flat_eff(dx, dy, marks)

tass_eff(dx, dy, marks, par = list(b = 3.52 * 0.975, c = 6.1,
    smark = 1))

gates_eff(dx, dy, marks, par = list(a = 1, b = 4, smark = 1))

gnomon_eff(dx, dy, marks, par = list(a = 1, b = 4, smark = 1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dx}{
%%     ~~Describe \code{dx} here~~
Vector of x-distances. Coordinates x for a number of points minus coordinate x of the subject plant.
}
  \item{dy}{
%%     ~~Describe \code{dy} here~~
Vector of y-distances. Coordinates y for a number of points minus coordinate y of the subject plant.
}
  \item{marks}{
%%     ~~Describe \code{marks} here~~
Mark data for the subject plant.
}
  \item{par}{
%%     ~~Describe \code{par} here~~
Optional vector or list of parameters.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
The user can program her/his own efficiency function. It must take the arguments \code{dx}, \code{dy}, \code{marks}, and optionally \code{par}.

Efficiency function values are normally non-negative. Otherwise, they are set to 0 in \code{assimilation()}.

The values of \code{par} are taken from the argument \code{effpar} of \code{assimilation()}, if not \code{NULL}. Otherwise the default is used.

\code{smark} in \code{par} must be 1 or \dQuote{mark} if there is only one mark. If the marks are a data frame, \code{smark} must be the number or name of the column with the plant size variable.

\code{flat_eff()} returns 1, independently of plant size or distance.

\code{tass_eff()}, \code{gates_eff()}, and \code{gnomon_eff()} are proportional to their influence function counterparts (see \code{\link{influence}}), scaled to be 1 at the origin.
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
\url{https://github.com/ogarciav/siplab}

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
multi_eff <- function (dx, dy, marks, par) {
    out <- numeric(length(dx))
    s <- marks$SPECIES == "Spruce"
    out[s] <- gnomon_eff(dx[s], dy[s], marks[s, ], par=list(a=par$aS,
        b=par$bS, smark=par$smark))
    out[!s] <- gnomon_eff(dx[!s], dy[!s], marks[!s, ], par=list(a=par$aH,
        b=par$bH, smark=par$smark)) # Hardwoods
    return(out)
}
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
