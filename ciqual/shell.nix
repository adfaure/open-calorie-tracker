{
  pkgs ? import (fetchTarball "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz") {},
}:

let
  r_pkgs = with pkgs.rPackages; [
    # add r packages here
    pkgs.R
    Rcpp
    fmsb
    devtools
    GGally
    yaml
    optparse
    knitr
    rmarkdown
    plyr
    viridis
    stringi
    gtools
    rgl
    hms
    corrplot
    tidyverse
    devtools
    fitdistrplus
    bookdown
    servr
  ];

in
pkgs.mkShell {
  buildInputs = [
    ## I use both rstudio an R
    (pkgs.rWrapper.override {
      packages = r_pkgs;
    })

    (pkgs.rstudioWrapper.override {
      packages = r_pkgs;
    })
  ];
}
