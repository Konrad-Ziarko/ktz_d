# unlimited history
if [ $(echo -e "4.3\n${BASH_VERSION}" | sort -V | head -n1) == "4.3" ]; then
    HISTSIZE=-1
    HISTFILESIZE=-1
else
    HISTSIZE=10000
    HISTFILESIZE=20000
fi
# ALIASES
alias sudo='sudo '
alias open='xdg-open'
alias ttmux='tmux attach'
alias sc='systemctl'
alias pu='pushd'
alias po='popd'
# ALIASES
# confirm command before executing from history
shopt -s histverify

NC='\033[0m'
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[0;33m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
White='\033[0;37m'

function ktzversion(){
    cat ~/.ktz.d/VERSION
}
