pairwise <- function(plants, maxN=NULL, maxR=NULL, select=NULL, selpar=NULL,
                     kernel, kerpar=NULL) {
# Pairwise competition indices
    # Competition index computation
    cindexf <- function(Y, current, dists, dranks,
                        select, selpar, kernel, kerpar) {
        # Narrow down to actual competitors
        if(!is.null(select) && npoints(Y) > 0) {
            if(is.null(selpar))
                comp <- select(imarks=marks(current), jmarks=marks(Y),
                               dists=dists, dranks=dranks)
            else
                comp <- select(imarks=marks(current), jmarks=marks(Y),
                               dists=dists, dranks=dranks, par=selpar)
            Y <- Y[comp]
            dists <- dists[comp]
            dranks <- dranks[comp]
        }
        # Competition index
        if(npoints(Y) > 0) {
            if(is.null(kerpar))
                return(sum(kernel(imarks=marks(current),
                                  jmarks=marks(Y), dists=dists, dranks=dranks)))
            else
                return(sum(kernel(imarks=marks(current),
                                  jmarks=marks(Y), dists=dists, dranks=dranks,
                                  par=kerpar)))
        } else return(0)
    } # end of function
    # Get indices
    if(is.null(maxN) && is.null(maxR))
        maxN <- plants$n  # applynbd requires at least one not null
    mark <- marks(plants)
    marks(plants) <- data.frame(mark, cindex=0)
    marks(plants)$cindex <- applynbd(plants, cindexf, N=maxN, R=maxR,
                                     exclude=TRUE, select=select, selpar=selpar,
                                     kernel=kernel, kerpar=kerpar)
    return(plants)
}
