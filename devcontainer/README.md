# My Devcontainer

## Try my development environment in a container

### Download image, build and run

> ##### Feel free to personalize the Dockerfile for your setup

```bash
mkdir devcontainer && cd devcontainer && \
    curl -fsSL https://raw.githubusercontent.com/GianlucaP106/dotfiles/main/devcontainer/Dockerfile > Dockerfile && \
    docker build -t devcontainer . && \
    docker run -d --name devcontainer devcontainer && \
    docker exec -it devcontainer /bin/zsh
```
