# Use the official Julia image
FROM julia:1.10.0

LABEL maintainer="Danton Noriega-Goodwin <github.com/dantonnoriega>"
LABEL description="This is the image for https://github.com/dantonnoriega/SR3TuringQuarto.jl"
LABEL version="1.0.0"
LABEL source="https://hub.docker.com/r/dantonnoriega/sr3-turing-quarto-jl"

# EXAMPLE USAGE
# $ docker pull dantonnoriega/sr3-turing-quarto-jl
# $ 

# Set the working directory
WORKDIR /workspace 

# Add Project.toml and Manifest.toml
# Instantiate; ensure IJulia builds; precompile
ADD *.toml /workspace/
RUN julia --project=/workspace -e "using Pkg; Pkg.instantiate(); Pkg.build(\"IJulia\"); Pkg.precompile();"
RUN rm /workspace/*.toml

# Install core linux tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    curl \
    less \
    tree \
    sudo \
    wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install quarto CLI
## SOURCE: https://andresrcs.rbind.io/2022/12/09/quarto_arm64/
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.550/quarto-1.4.550-linux-arm64.deb
RUN dpkg -i quarto-1.4.550-linux-arm64.deb
RUN rm /workspace/quarto-1.4.550-linux-arm64.deb


# Install Python 3 and Jupyter
## SOURCE: https://askubuntu.com/questions/737094
RUN apt-get update && \
    apt-get install -y python3 \
    python3-pip \
    python3-yaml \
    jupyter-notebook \
    jupyter && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
