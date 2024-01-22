# \[WIP\] Statistical Rethinking (3rd edition) with Julia (Turing and Quarto)

This repo contains my attempt to reproduce the R code in the upcoming 3rd edition of [Statistical Rethinking](https://xcelab.net/rm/statistical-rethinking/) to [Julia](https://julialang.org/).

The MCMC engine will be [Turing.jl](https://turing.ml) and the notebooks are written with [Quarto](https://quarto.org).

Code was originally inspired (and ported) from repo [StatisticalRethinkingJulia/SR2TuringJupyter.jl](https://github.com/StatisticalRethinkingJulia/SR2TuringJupyter.jl).

## Run Requirements

It is recommended to use Docker. It ensure reproducibility.

If you prefer to install locally, [skip down](#local).

### Docker

Clone this repo (`dantonnoriega/SR3TuringQuarto.jl.git`)

``` sh
## clone and enter project directory
git clone git@github.com:dantonnoriega/SR3TuringQuarto.jl.git
cd SR3TuringQuarto.jl
```

After cloning, you have two options:

1.  Run directly in VS Code via command [`Dev Containers: Open Folder in Container...`](https://code.visualstudio.com/docs/devcontainers/containers#_quick-start-open-an-existing-folder-in-a-container)
2.  Spin up your own container then attach VS Code via command [`Dev Containers: Attach to Running Container...`](https://code.visualstudio.com/docs/devcontainers/attach-container)

#### (1) `Dev Containers: Open Folder in Container...`

Start up Docker, open the Command Palette (`F1`) in VS Code and run `Dev Containers: Open Folder in Container...`.

That should be it!

#### (2) `Dev Containers: Attach to Running Container...`

Start up Docker, then pull image `dantonnoriega/sr3-turing-quarto-jl` then run

``` sh
docker pull dantonnoriega/sr3-turing-quarto-jl
# assumes one is currently in ../SR3TuringQuarto.jl
docker run --rm -d -it -v $(pwd):/workspace/SR3TuringQuarto.jl dantonnoriega/sr3-turing-quarto-jl
```

One can then load up VS Code and attach to the running container (Command: `Dev Container: Attach to Running Container...`).

### Local {#local}

To run the code in this repo, you need to have `julia` and `quarto` installed.

#### Julia

`julia` can be easily installed on macOS using brew

``` sh
# install julia
brew install --cask julia
```

#### Quarto

For macOS using brew

``` sh
# install quarto
brew install --cask quarto

# install librsvg (render svg in pdfs) and python3 (if not installed)
brew install librsvg python3

# need jupyter for python to render julia qmd pdfs
## !! be mindful about which python environment and version you're using (system vs brew vs pyenv vs conda etc)
python3 -m pip install jupyter
```

(optional) Set up quarto to properly [render PDFs](https://quarto.org/docs/output-formats/pdf-engine.html#overview).

``` sh
quarto install tinytex
```

#### Running Quarto + Julia Notebooks Locally (Clone, Activate, & Instantiate)

After satisfying the **Run Requirements** above, you should be able to run the Quarto `*.qmd` files in `notesbooks/` locally.

-   Clone this repo (`dantonnoriega/SR3TuringQuarto.jl.git`)

    ``` sh
    ## clone and enter project directory
    git clone git@github.com:dantonnoriega/SR3TuringQuarto.jl.git
    cd SR3TuringQuarto.jl
    ```

-   Run Julia and [`activate` and then `instantiate` this project](https://pkgdocs.julialang.org/v1/environments/#Using-someone-else's-project)

    ``` sh
    ## start julia in your terminal
    julia
    ```

    Within julia (`julia>`) you can then run

    ``` julia
    using Pkg
    Pkg.activate()
    Pkg.instantiate()
    ```

    OR enter Pkg REPL by hitting `]` and run

    ``` julia
    ## hit "]" to enter Pkg REPL (https://pkgdocs.julialang.org/v1/getting-started/#Basic-Usage)
    activate .
    instantiate
    ```