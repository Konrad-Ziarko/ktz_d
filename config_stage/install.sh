#!/bin/bash
# this script is lauched on installation target
source ./definitions.sh
set -e
tar -xvf ./payload.tar -C "${HOME}"

if ! which vim >/dev/null 2>&1; then
    echo "VIM is missing!"
    exit 1
fi
if ! which tmux >/dev/null 2>&1; then
    echo "TMUX is missing!"
    exit 1
fi

bash_line="source ~/.ktz.d/.bashrc"
bash_file="${HOME}/.bashrc"
touch ${bash_file}
if [ $(grep -c "${bash_line}" ${bash_file}) -eq 0 ]; then
    [ "$(tail -c1 ${bash_file})" != "" ] && echo >>${bash_file}
    echo ${bash_line} >>${bash_file}
    echo "Extended bash config!"
else
    echo "Bash already extended"
fi

vim_line="source ~/.ktz.d/.vimrc"
vim_file="${HOME}/.vimrc"
touch ${vim_file}
if [ $(grep -c "${vim_line}" "${vim_file}") -eq 0 ]; then
    [ "$(tail -c1 ${vim_file})" != "" ] && echo >>${vim_file}
    echo ${vim_line} >>${vim_file}
    echo "Extended vim config!"
else
    echo "Vim aleardy extended"
fi

tmux_line="source-file ~/.ktz.d/.tmux.conf"
tmux_file="${HOME}/.tmux.conf"
touch ${tmux_file}
if [ $(grep -c "${tmux_line}" ${tmux_file}) -eq 0 ]; then
    [ "$(tail -c1 ${tmux_file})" != "" ] && echo >>${tmux_file}
    echo ${tmux_line} >>${tmux_file}
    echo "Extended tmux config!"
else
    echo "Tmux already extended"
fi

echo "Configuration copied successfully!"

