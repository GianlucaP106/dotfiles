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
    git build-essential vim neovim tmux curl \
    make unzip zsh rgrep jq fzf inetutils-ping \
    # languages
    python3.12-venv python3 npm \
    golang-go clang libx11-dev

# installs
RUN \
    # treesitter
    npm install -g tree-sitter-cli && \
    # ohmyzsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    # tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
    # neovim config
    git clone https://github.com/GianlucaP106/lazyvim-config ~/.config/nvim && \
    # mynav
    curl -fsSL https://raw.githubusercontent.com/GianlucaP106/mynav/main/install.sh | bash && \
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
ENV PATH="$PATH:$HOME/.mynav"

# setup dotfiles
RUN \
    git clone https://github.com/GianlucaP106/dotfiles && \
    cp ./dotfiles/zsh/zshrc.sh ~/.zshrc && \
    cp ./dotfiles/tmux/tmux.conf ~/.tmux.conf

ENTRYPOINT [ "/bin/zsh" ]
