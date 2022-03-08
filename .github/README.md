# siplab  -  Spatial Individual-Plant Simulation

An R platform for computing competition indices and experimenting with spatially explicit individual-based vegetation models.

![influence](infl-small.jpg)

Current stable _siplab_. Version 1.6 on CRAN:  <https://cran.r-project.org/package=siplab>

### Installation

Install the stable version from CRAN:  `install.packages("siplab")`\
or with the RStudio menus: *Tools > Install Packages... > siplab* 

For testing the bleeding-edge development version from here use  `devtools::install_github("ogarciav/siplab")`

### Quick demo

Computing Hegyi's competition index:
```r
hegyi <- pairwise(spruces, maxR=6, kernel=powers_ker,
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

### Vignettes

1. [Computing Hegyi’s (and other) Competition Indices.]<https://cran.r-project.org/web/packages/siplab/vignettes/cindex.pdf>
2. [A Gentle Guide to Fully Spatial Models.]<https://cran.r-project.org/web/packages/siplab/vignettes/gentle.pdf>

### References

* García, O. (2014). "Siplab, a spatial individual-based plant modelling system". *Computational Ecology and Software 4*(4): 215-222. [PDF](https://www.researchgate.net/publication/267695426)
* García, O. (2014). "A generic approach to spatial individual-based modelling and simulation of plant communities". *Mathematical and Computational Forestry and Nat.-Res. Sci. (MCFNS) 6*(1), 36-47. [PDF](http://mcfns.net/index.php/Journal/article/view/6_36)
* García, O. (2014). "Can plasticity make spatial structure irrelevant in individual-tree models?" *Forest Ecosystems* 1, 16. [PDF](https://dx.doi.org/10.1186/s40663-014-0016-1)
* García, O. (2022) "Plasticity as a link between spatially explicit, distance-independent, and whole-stand forest growth models". *Forest Science 68*(1): 1–7. [Web](https://doi.org/10.1093/forsci/fxab043)
* Lee, M. J. and García, O. (2016). "Plasticity and Extrapolation in Modeling Mixed-Species Stands". *Forest Science 62*(1): 1-8. [PDF](https://www.researchgate.net/publication/280939838)
