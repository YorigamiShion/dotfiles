export ZSH="/root/.oh-my-zsh"
source ~/tools/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle python
antigen bundle heroku
antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions.
# antigen bundle zsh-users/history-substring-search.
antigen bundle skywind3000/z.lua
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle MichaelAquilina/zsh-autoswitch-virtualenv
antigen bundle gradle/gradle-completion

antigen theme robbyrussell

antigen apply


eval "$(starship init zsh)"
eval "$(pipenv --completion)"
