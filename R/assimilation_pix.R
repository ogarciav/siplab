assimilation_pix <-
function(plants, # marked point pattern (class ppp)
         pixsize=0.2, # resolution (pixel size)
         resource=1, # resource map
         influence=gnomon_inf, # influence function
         infpar=NULL, # influence function parameter(s)
         asym=Inf, # asymmetry parameter
         efficiency=flat_eff, # efficiency function
         effpar=NULL, # efficiency function parameter(s)
         plot=TRUE, # plot influences map?
         afree=FALSE, # include free-growing assimilation in output?
         centroid=FALSE # include assimilation centroids in output?
        )
{
    # Resource pixel image
    resource <- as.im(resource, as.mask(plants, eps=pixsize))
    # Extract info
    xplant <- coords(plants)$x
    yplant <- coords(plants)$y
    marks <- as.data.frame(marks(plants))
    # First pass, acccumulate partition function denominator
    if(is.null(infpar)) { # use the influence default parameters, if any
        infi <- function(y, x) pmax(0, influence(dx = x - xplant[i],
            dy = y - yplant[i], marks = marks[i, ]))
    } else { # pass the given influence function parameters
        infi <- function(y, x) pmax(0, influence(dx = x - xplant[i],
            dy = y - yplant[i], marks = marks[i, ], par = infpar))
    }
    denom <- as.im(0, resource)
    for(i in 1:npoints(plants)) {
        phi <- as.im(infi, resource)
        if(is.infinite(asym)) denom <- eval.im(pmax(denom, phi))
        else if(asym > 0) denom <- eval.im(denom + phi^asym)
        else denom <- eval.im(denom + (phi > 0))  # asym == 0
    }
    if(plot) plot(denom, main=NULL)
    # Second pass, get assimilation index for each plant
    if(is.null(effpar)) {
        effi <- function(x, y) pmax(0, efficiency(dx = x - xplant[i],
            dy = y - yplant[i], marks = marks[i, ]))
    } else {
        effi <- function(x, y) pmax(0, efficiency(dx = x - xplant[i],
            dy = y - yplant[i], marks = marks[i, ], par = effpar))
    }
    for(i in 1:npoints(plants)) {
        phi <- as.im(infi, resource)
        if(is.infinite(asym)) part <- eval.im((phi >= denom) * (phi > 0))
        else if(asym > 0) part <- eval.im(phi^asym / (denom + (denom == 0)))
                                                    # (avoid division by 0)
        else part <- eval.im((phi > 0) / (denom + (denom == 0))) # asym == 0
        eff <- as.im(effi, resource)
        assim <- eval.im(eff * part * resource)
        marks$aindex[i] <- integral.im(assim)
        if (afree) {
            marks$afree[i] <- integral.im(eval.im(eff * (phi > 0) * resource))
        }
        if(centroid) {
            xim <- as.im(function(x, y) x, resource)
            marks$cx[i] <- integral.im(eval.im(xim * assim)) / marks$aindex[i]
            yim <- as.im(function(x, y) y, resource)
            marks$cy[i] <- integral.im(eval.im(yim * assim)) / marks$aindex[i]
        }
    }
    # Add results to marks, return
    marks(plants) <- marks
    return(plants)
}
