# siplab  -  Spatial Individual-Plant Simulation

An R platform for computing competition indices and experimenting with spatially explicit individual-based vegetation models.

![influence](infl-small.jpg)

* **Master** branch: Current _siplab_ version 1.4 in CRAN,  <https://cran.r-project.org/package=siplab>
* **Development** branch: Work in progress for next version.

### Installation

Install the stable version from CRAN:  `install.packages("siplab")`\
or from the RStudio menus: *Tools > Install Packages... > siplab* 

For testing the bleeding-edge development version from here use  `devtools::install_github("ogarciav/siplab")`

### Quick demo

Computing Hegyi's competition index:
```r
hegyi <- pairwise(spruces, maxR=6, kernel=powers.ker,
    kerpar=list(pi=1, pj=1, pr=1, smark=1))
head(marks(hegyi))
```

Areas of Brown's APAs (aka Dirichlet cells or Voronoi polygons):
```r
trees <- spruces
marks(trees) <- 100
apa <- assimilation(trees)
summary(marks(apa))
```

### Vignettes (drafts)

1. [Computing Hegyi’s (and other) Competition Indices.](https://www.researchgate.net/publication/343112487)
2. [A Gentle Guide to Fully Spatial Models](https://www.researchgate.net/publication/343112736)

### References:
* García, O. (2014). "Siplab, a spatial individual-based plant modelling system". *Computational Ecology and Software 4*(4): 215-222. [PDF](https://www.researchgate.net/publication/267695426)
* García, O. (2014). "A generic approach to spatial individual-based modelling and simulation of plant communities". *Mathematical and Computational Forestry and Nat.-Res. Sci. (MCFNS) 6*(1), 36-47. [PDF](http://mcfns.net/index.php/Journal/article/view/6_36)
* García, O. (2014). "Can plasticity make spatial structure irrelevant in individual-tree models?" *Forest Ecosystems* 1, 16. [PDF](https://dx.doi.org/10.1186/s40663-014-0016-1)
* Lee, M. J. and García, O. (2016). "Plasticity and Extrapolation in Modeling Mixed-Species Stands". *Forest Science 62*(1): 1-8. [PDF](https://www.researchgate.net/publication/280939838)
