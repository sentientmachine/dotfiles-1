# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

export HOMEBREW_GITHUB_API_TOKEN="f1035918c42a9b60e0d46d35adbbc3c5ad3c056b"

# By default, ^S freezes terminal output and ^Q resumes it. Disable that so
# that those keys can be used for other things.
unsetopt flowcontrol

export AWS_DEFAULT_REGION=us-east-1

# setopt auto_cd
# cdpath=($HOME/code $HOME/code/spree $HOME/code/rails)

export VISUAL=nvim
export EDITOR="$VISUAL"

# rbenv
export PATH="$HOME/.bin:$PATH"
eval "$(rbenv init - --no-rehash)"

# node
export PATH="$HOME/.node/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# go
export PATH=$PATH:~/src/go/bin
export GOPATH=$HOME/src/go

# elixir
export PATH="$PATH:/path/to/elixir/bin"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# yarn
export PATH="$PATH:`yarn global bin`"

# fuzzyfinder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Auto-attach new shell sessions in tmux
_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running

# make nvim the manpager
export MANPAGER="nvim -c 'set ft=man' -"

# Pure: Pretty, minimal and fast ZSH prompt
autoload -U promptinit && promptinit
prompt pure

# Hub
eval "$(hub alias -s)"

# Vim-Conflicted
function conflicted { nvim +Conflicted }

# Git wrapper
export PATH="$HOME/bin:$PATH"

# color man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[line]=none
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
ZSH_HIGHLIGHT_STYLES[alias]=fg=cyan
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases