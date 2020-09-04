\encoding{UTF-8}
\name{influence}
%- Also NEED an '\alias' for EACH other topic documented here.
\alias{influence}
\alias{zoi_inf}
\alias{tass_inf}
\alias{gates_inf}
\alias{gnomon_inf}
\title{
%%  ~~function to do ... ~~
Influence Functions
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Compute influence values depending on distance and plant marks, for use in \code{\link{assimilation}()}.

Note: In previous versions of \pkg{siplab} the function names had
\code{.inf} in place of \code{_inf}.
}
\usage{
zoi_inf(dx, dy, marks, par = list(k = 0.2, smark = 1))

tass_inf(dx, dy, marks, par = list(b = 3.52 * 0.975, c = 6.1,
    smark = 1))

gates_inf(dx, dy, marks, par = list(a = 1, b = 4, smark = 1))

gnomon_inf(dx, dy, marks, par = list(a = 1, b = 4, smark = 1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dx}{
%%     ~~Describe \code{dx} here~~
Vector of x-distances. Coordinates x for a number of points minus coordinate x of the subjectt plant.
}
  \item{dy}{
%%     ~~Describe \code{dy} here~~
Vector of y-distances. Coordinates y for a number of points minus coordinate y of the subjectt plant.
}
  \item{marks}{
%%     ~~Describe \code{marks} here~~
Mark data for the subject plant.
}
  \item{par}{
%%     ~~Describe \code{par} here~~
List of parameters.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
The user can program her/his own influence function. It must take the arguments \code{dx}, \code{dy}, \code{marks}, and optionally \code{par}.

Influence function values are normally non-negative. Otherwise, they are set to 0 in \code{assimilation()}.

The values of \code{par} are taken from the argument \code{infpar} of \code{assimilation()}, if not \code{NULL}. Otherwise the default is used.

\code{smark} in \code{par} must be 1 or \dQuote{mark} if there is only one mark. If the marks are a data frame, \code{smark} must be the number or name of the column with the plant size variable.

Let \eqn{S} be the plant size, and \eqn{R} be the Euclidean plant-to-point distance \eqn{R = \sqrt{\mathrm{dx}^2 + \mathrm{dy}^2}}{R = sqrt(dx^2 + dy^2)}. Then the built-in influence functions are:
\describe{
\item{\code{zoi_inf()}:}{1 if \eqn{R < k S}, 0 otherwise}

\item{\code{tass_inf()}:}{\eqn{\max\{0, \, S - c[\exp(R/b) - 1]\}}{max{0, S - c[exp(R/b) - 1]}}}

\item{\code{gates_inf()}:}{\eqn{\max\{0, \, [S^a - (b R)^a]^{1/a}\}}{max{0, [S^a - (bR)^a]^(1/a)}}}

\item{\code{gnomon_inf()}:}{\eqn{\max\{0, \, S - b R^a\}}{max{0, S - b R^a}}}
}
Other influence functions can be written following these examples.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Vector of influence values, of length equal to the length of dx and dy.
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
\code{\link{assimilation}}
}

\examples{
# Example multi-species influence function (spruce/hardwoods)
multi_inf <- function (dx, dy, marks, par) {
    out <- numeric(length(dx))
    s <- marks$SPECIES == "Spruce"
    out[s] <- gnomon_inf(dx[s], dy[s], marks[s, ], par=list(a=par$aS,
        b=par$bS, smark=par$smark))
    out[!s] <- gnomon_inf(dx[!s], dy[!s], marks[!s, ], par=list(a=par$aH,
        b=par$bH, smark=par$smark)) # Hardwoods
    return(out)
}
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
