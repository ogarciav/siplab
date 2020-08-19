staebler_ker <-
function(imarks, jmarks, dists, dranks, par = list(k=0.1, p=1, smark=1)) {
# Staebler's competition kernel, ZOI overlap. Assume ZOI radius = k S^p
    with(as.list(par), {
         Ri <- k * imarks[[smark]]^p
         Rj <- k * jmarks[smark]^p
         pmax(0, Ri + Rj - dists)
    })
}
