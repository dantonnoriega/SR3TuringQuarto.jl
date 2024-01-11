# DRAFT -- StatisticalRethinking (3rd edition) with Julia (Turing and Quarto)

This repo attempts to reproduce the R code in the upcoming 3rd edition of the "Statistical Rethinking" in Julia. The MCMC engine will be `Turing.jl` and the notebooks will be written with [Quarto](https://quarto.org).

Code was originally inspired (and ported) from repo [StatisticalRethinkingJulia/SR2TuringJupyter.jl](https://github.com/StatisticalRethinkingJulia/SR2TuringJupyter.jl).

## Run Requirements - Quarto

For MacOS using brew

```sh
# install quarto
brew install --cask quarto

# install librsvg (render svg in pdfs) and python3 (if not installed)
brew install librsvg python3

# need jupyter for python to render julia qmd pdfs
python3 -m pip install jupyter
```

Then set up quarto to properly [render PDFs](https://quarto.org/docs/output-formats/pdf-engine.html#overview).

```sh
quarto install tinytex
```