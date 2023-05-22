if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]
then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# In new version it backups this config and substitutes with different one.
if ! [ -f $HOME/.local/share/zap/zap.zsh ]; then
  curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh | zsh
fi
source $HOME/.local/share/zap/zap.zsh

ZHOME=${ZDOTDIR:-$HOME}

HISTFILE=$ZHOME/.history.zsh
HISTSIZE=1000000000
SAVEHIST=1000000000

fpath=(/usr/share/zsh/site-functions $fpath)

setopt autocd nonomatch histignorealldups completeinword interactivecomments

ZSHZ_CMD=f
plug agkozak/zsh-z
plug zap-zsh/completions
plug romkatv/powerlevel10k
plug zap-zsh/sudo
plug hlissner/zsh-autopair

plug zsh-users/zsh-syntax-highlighting
ZSH_HIGHLIGHT_STYLES[comment]='fg=#777'

plug zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^ ' autosuggest-accept
bindkey '^e' autosuggest-execute
bindkey '^I' expand-or-complete-prefix

plug zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^k' history-substring-search-up
bindkey '^j' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

zmodload zsh/complist
bindkey -M menuselect '^H' backward-char
bindkey -M menuselect '^K' up-line-or-history
bindkey -M menuselect '^L' forward-char
bindkey -M menuselect '^J' down-line-or-history
bindkey '^R' history-incremental-search-backward

autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd ' ' edit-command-line

WORDCHARS=${WORDCHARS/\/}
bindkey '^f' forward-word
bindkey '^b' backward-word

bindkey -v
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^W' backward-delete-word
bindkey '^U' backward-kill-line

zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete _prefix

autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit
# source /usr/share/bash-completion/completions/R

# source /etc/zsh_command_not_found
# source /usr/share/zsh/site-functions/lfcd.sh
# source $HOME/.aliases
source $ZHOME/aliases.zsh
source $ZHOME/.p10k.zsh

# [ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] &&
# source "$SDKMAN_DIR/bin/sdkman-init.sh"
# source "$HOME/.micromamba/init.sh"
