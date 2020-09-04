\encoding{UTF-8}
\name{select}
\alias{select}
%- Also NEED an '\alias' for EACH other topic documented here.
\alias{size_sel}
\alias{powlinear_sel}
\title{
%%  ~~function to do ... ~~
Competitor Selection Rules
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Functions returning TRUE for plants that compete with a given subject plant, or FALSE otherwise. The decision can depend on distance and plant marks. For use in \code{\link{pairwise}()}.

Note: In previous versions of \pkg{siplab} the function names had
\code{.sel} in place of \code{_sel}.
}
\usage{
size_sel(imarks, jmarks, dists, dranks, par = list(k = 0.2, smark
    = 1))

powlinear_sel(imarks, jmarks, dists, dranks, par = list(ki = 0.2,
    kj = 0, p = 1, r0 = 0, smark=1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{imarks}{
%%     ~~Describe \code{imarks} here~~
Marks for the subject plant, a 1-row data frame.}
  \item{jmarks}{
%%     ~~Describe \code{jmarks} here~~
Data frame with marks for potential competitors}
  \item{dists}{
%%     ~~Describe \code{dists} here~~
Vector of distances between the subject plant and the potential competitors.}
  \item{dranks}{
%%     ~~Describe \code{dranks} here~~
Distance ranks.}
  \item{par}{
%%     ~~Describe \code{par} here~~
List of parameters.}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
The values of \code{par} are taken from the argument \code{selpar} of \code{pairwise()}, if not \code{NULL}.

\code{smark} in \code{par} must be 1 or \dQuote{mark} if there is only one mark. If the marks are a data frame, \code{smark} must be the number or name of the column with the plant size variable.

\code{size_sel()} is a simple example where competitors are selected within a radius proportional to plant size. This corresponds to the second example in Section 9.2.1 of Burkhart and \enc{Tomé}{Tome} (2012).

Note that their first example (fixed radius) is implemented by giving a value to \code{maxR} in \code{\link{pairwise}()}, no \code{select} function is needed. Similarly, their third example (fixed number of nearest neighbors) is obtained by giving a value to \code{maxN}.

\code{powlinear_sel()} is a general form that covers all the other examples in Burkhart and \enc{Tomé}{Tome} (2012) by choosing specific parameters values  (except for the \emph{competition elimination angle}, which depends on relative positions among competitors and not only on distances).
It implements a condition \code{distance < ki * sizei^p + kj * sizej^p + r0}, with the following special cases:
\describe{
\item{ }{Multiple of crown radius: \code{kj=0, p=1, r0=0, smark="crownwidth"}.}
\item{ }{Angle count sampling: \code{ki=0, p=1, r0=0, smark="dbh"}.}
\item{ }{Areas of influence overlap: \code{ki=kj, p=1, r0=0}, if the radius is a linear function of size (\code{p} not 1 for an allometric relationship).}
\item{ }{Vertical search cone: If the height of the cone vertex is constant, proportional to tree height, or more generally some linear function \eqn{c_1 h_i + c_2}, then \code{ki} = \eqn{- c_1 / \tan(90 - \beta/2)}, \code{kj} = \eqn{1 / \tan(90 - \beta/2)}, \code{p=1}, \code{r0} = \eqn{- c_2 / \tan(90 - \beta/2)}, \code{smark="height"}.}  
}
These and other examples could be coded directly if computational efficiency is important.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Logical vector of length equal to the length of \code{dists}.
}
\references{
%% ~put references to the literature/web site here ~
\url{https://github.com/ogarciav/siplab}

Burkhart, H. E. and \enc{Tomé}{Tome}, M. (2012) \emph{Modeling Forest Trees and Stands}. Springer.
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
\code{\link{pairwise}}
}
%\examples{
%}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
