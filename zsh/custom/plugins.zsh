# =============================================================================
#                                   Plugins
# =============================================================================
# Path to your oh-my-zsh installation.
export ZSH=".zsh-plugins/ohmyzsh"

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update
    zplug "zplug/zplug", hook-build:"zplug --self-manage"
fi
source ~/.zplug/init.zsh

# oh-my-zsh
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"

# Load theme
zplug "mafredri/zsh-async", from:github, use:async.zsh
zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme, from:github, at:next, as:theme, depth:1

zplug "chrissicool/zsh-256color"

# enhancedcd
zplug "b4b4r07/enhancd", use:init.sh

# enhanced history
zplug "b4b4r07/zsh-history-ltsv", use:init.sh

# Miscellaneous commands
zplug "zdharma/zsh-diff-so-fancy"
zplug "peco/peco", as:command, from:gh-r, use:"*${(L)$(uname -s)}*amd64*"

# Bookmarks and jump
zplug "jocelynmallon/zshmarks"

zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/common-aliases",    from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/copydir",           from:oh-my-zsh
zplug "plugins/copyfile",          from:oh-my-zsh
zplug "plugins/cp",                from:oh-my-zsh
zplug "plugins/dircycle",          from:oh-my-zsh
zplug "plugins/encode64",          from:oh-my-zsh
zplug "plugins/extract",           from:oh-my-zsh
zplug "plugins/fancy-ctrl-z",      from:oh-my-zsh
zplug "plugins/history",           from:oh-my-zsh
zplug "plugins/urltools",          from:oh-my-zsh
zplug "plugins/web-search",        from:oh-my-zsh
zplug "plugins/z",                 from:oh-my-zsh
zplug "plugins/zsh_reload",        from:oh-my-zsh

# Supports oh-my-zsh plugins and the like
if [[ $OSTYPE = (linux)* ]]; then
    zplug "plugins/archlinux",     from:oh-my-zsh, if:"(( $+commands[pacman] ))"
    zplug "plugins/dnf",           from:oh-my-zsh, if:"(( $+commands[dnf] ))"
    zplug "plugins/mock",          from:oh-my-zsh, if:"(( $+commands[mock] ))"
fi

if [[ $OSTYPE = (darwin)* ]]; then
    zplug "lib/clipboard",         from:oh-my-zsh
    zplug "plugins/osx",           from:oh-my-zsh
    zplug "plugins/macports",      from:oh-my-zsh, if:"(( $+commands[port] ))"
fi

zplug "plugins/brew",           from:oh-my-zsh, if:"(( $+commands[brew] ))"
zplug "plugins/dotnet",         from:oh-my-zsh, if:"(( $+commands[dotnet] ))"
zplug "plugins/git",            from:oh-my-zsh, if:"(( $+commands[git] ))"
zplug "plugins/golang",         from:oh-my-zsh, if:"(( $+commands[go] ))"
zplug "plugins/node",           from:oh-my-zsh, if:"(( $+commands[node] ))"
zplug "plugins/npm",            from:oh-my-zsh, if:"(( $+commands[npm] ))"
zplug "plugins/pip",            from:oh-my-zsh, if:"(( $+commands[pip] ))"
zplug "plugins/sudo",           from:oh-my-zsh, if:"(( $+commands[sudo] ))"
zplug "plugins/gpg-agent",      from:oh-my-zsh, if:"(( $+commands[gpg-agent] ))"
zplug "plugins/ssh-agent",      from:oh-my-zsh, if:"(( $+commands[ssh-agent] ))"
zplug "plugins/systemd",        from:oh-my-zsh, if:"(( $+commands[systemctl] ))"
zplug "plugins/docker",         from:oh-my-zsh, if:"(( $+commands[docker] ))"
zplug "plugins/docker-compose", from:oh-my-zsh, if:"(( $+commands[docker-compose] ))"
zplug "plugins/tmux",           from:oh-my-zsh, if:"(( $+commands[tmux] ))"
zplug "plugins/tmuxinator",     from:oh-my-zsh, if:"(( $+commands[tmuxinator] ))"
zplug "plugins/terraform",      from:oh-my-zsh, if:"(( $+commands[terraform] ))"

zplug "djui/alias-tips"
zplug "hlissner/zsh-autopair", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"

# zsh-syntax-highlighting must be loaded after executing compinit command
# and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
