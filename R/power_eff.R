power_eff <-
function(dx, dy, marks=NULL, par=list(a=1, b=0.25, smark=NULL)) {
# Size-independent efficiency functions  1 - b R^a
    with(as.list(par),
        pmax(0, 1 - b * (dx^2 + dy^2)^(a/2))
    )
}
