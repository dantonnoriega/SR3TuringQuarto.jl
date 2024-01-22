# Use the official Julia image
FROM julia:1.10.0

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
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-arm64.deb
RUN dpkg -i quarto-1.3.450-linux-arm64.deb


# Install Python 3 and Jupyter
## SOURCE: https://askubuntu.com/questions/737094
RUN apt-get update && \
    apt-get install -y python3 \
    python3-pip \
    jupyter-notebook \
    jupyter && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install code-server for ARM64
RUN curl -fsSL https://code-server.dev/install.sh | ARCH=arm64 sh

# Install VS Code extensions
RUN code-server --install-extension julialang.language-julia
RUN code-server --install-extension yzhang.markdown-all-in-one
RUN code-server --install-extension quarto.quarto
RUN code-server --install-extension george-alisson.html-preview-vscode
