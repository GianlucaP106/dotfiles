FROM ubuntu:latest

# global env vars
ENV \
    SHELL="/bin/zsh" \
    TERM="xterm-256color" \
    LANG="en_CA.UTF-8"

# make the home dir the workdir
WORKDIR /root

# apt get installs
RUN \
    apt-get update && \
    apt-get install -y \
    # base packages & tools
    git build-essential tree vim tmux curl clangd \
    make unzip zsh rgrep jq inetutils-ping uuid-runtime \
    # languages
    python3.12-venv python3 npm \
    golang-go clang libx11-dev

# installs
RUN \
    # treesitter
    npm install -g tree-sitter-cli && \
    # fzf
    curl -L -o /tmp/fzf.tar.gz https://github.com/junegunn/fzf/releases/download/v0.60.2/fzf-0.60.2-linux_arm64.tar.gz && \
    tar -xf /tmp/fzf.tar.gz -C /tmp && \
    mv /tmp/fzf /usr/local/bin && \
    # ohmyzsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    # catppuccin
    mkdir -p ~/.config/tmux/plugins/catppuccin && \
    git clone https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux && \
    # neovim
    curl -L -o /tmp/nvim.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz && \
    tar -xf /tmp/nvim.tar.gz -C /tmp && \
    mv /tmp/nvim-linux-arm64/share/nvim/runtime /usr/local/share/nvim && \
    mv /tmp/nvim-linux-arm64/bin/nvim /usr/local/bin && \
    # neovim config
    git clone https://github.com/GianlucaP106/lazyvim-config ~/.config/nvim && \
    # mynav
    curl -fsSL https://raw.githubusercontent.com/GianlucaP106/mynav/main/install.bash | bash && \
    # lazygit
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') && \
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
    tar xf lazygit.tar.gz lazygit && \
    install lazygit /usr/local/bin && \
    rm ~/lazygit* && \
    # rustup & cargo
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# add more installs as u go...

# path mofications
ENV PATH="$PATH:/root/.mynav"

# setup dotfiles
RUN \
    git clone https://github.com/GianlucaP106/dotfiles && \
    cp ./dotfiles/zsh/zshrc.sh ~/.zshrc && \
    cp ./dotfiles/tmux/tmux.conf ~/.tmux.conf

ENTRYPOINT [ "sleep", "infinity" ]
