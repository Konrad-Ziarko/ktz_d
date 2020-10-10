# unlimited history
HISTSIZE=-1
HISTFILESIZE=-1
# ALIASES
alias sudo='sudo '
alias open='xdg-open'
alias ttmux='tmux attach'
alias sc='systemctl'
# ALIASES

NC='\033[0m'
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

function copyssh(){
    cp -f ~/.ktz.d/.ssh/config ~/.ssh/config
    cp -F ~/.ktz.d/.ssh/*_id_rsa ~/.ssh/
}

function ktzhelp(){
    echo -e "
${Green}WSL mount usb drive${NC}:
sudo mkdir /mnt/h && sudo mount -t drvfs H: /mnt/h
${Cyan}TMUX${NC}:
${Green}Tmux-resurrect${NC}:
prefix C-s # save env
prefix C-r # load env
${Green}TMUX${NC}:
prefix z # fullscreen

${Green}TMUX-VIM copy${NC}:
prefix+[, space, enter, prefix+]

${Cyan}VIM${NC}:
u            # undo
C-r          # redo
:set paste   # fix indentations when pasting via os clipboard

${Cyan}TAR${NC}:
${Green}Extract the file to the current directory${NC}:
tar -zxvf yourfile.tar.gz
${Green}Extract to specific directory${NC}:
tar -C /myfolder -zxvf yourfile.tar.gz
${Green}To extract ${Red}.tar${Green} file just drop ${Red}-z${Green} flag${NC}

${Green}Switch to root & preserve environment${NC}:
sudo -E bash
"
}


