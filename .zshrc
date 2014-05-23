# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '${HOME}/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [ -f ~/.bash_aliases ] ; then
    source ~/.bash_aliases
fi

autoload -U colors && colors
PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%}$ "
