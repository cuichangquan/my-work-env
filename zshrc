# ~/.zshrc

# About work
if [ -f ~/.public_alias ]; then
  . ~/.public_alias
fi

if [ -f ~/.private_alias ]; then
  . ~/.private_alias
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/z/z.sh ] && source ~/z/z.sh

alias zshrc='vim ~/.zshrc'
alias sss='source ~/.zshrc'

# Useing direnv
eval "$(direnv hook zsh)"
# Useing anyenv
eval "$(anyenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('`$CONDA_BASE_HOME`/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$CONDA_BASE_HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$CONDA_BASE_HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA_BASE_HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# condaの仮装環境のコントロール
# conda activate
# conda deactivate

# Node.js install
export PATH=$HOME/.nodebrew/current/bin:$PATH
