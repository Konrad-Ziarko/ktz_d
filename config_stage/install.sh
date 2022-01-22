#!/bin/bash
# this script is launched on installation target
source ./definitions.sh
set -e
tar -xvf ./payload.tar -C "${HOME}"

vim_missing=false
tmux_missing=false

if ! which vim >/dev/null 2>&1; then
    echo "VIM is missing!"
    vim_missing=true
fi
if ! which tmux >/dev/null 2>&1; then
    echo "TMUX is missing!"
    tmux_missing=true
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
if [[ ${vim_missing} == false ]]; then
  touch ${vim_file}
  if [ $(grep -c "${vim_line}" "${vim_file}") -eq 0 ]; then
      [ "$(tail -c1 ${vim_file})" != "" ] && echo >>${vim_file}
      echo ${vim_line} >>${vim_file}
      echo "Extended vim config!"
  else
      echo "Vim already extended"
  fi
fi

tmux_line="source-file ~/.ktz.d/.tmux.conf"
tmux_file="${HOME}/.tmux.conf"
if [[ ${tmux_missing} == false ]]; then
  touch ${tmux_file}
  if [ $(grep -c "${tmux_line}" ${tmux_file}) -eq 0 ]; then
      [ "$(tail -c1 ${tmux_file})" != "" ] && echo >>${tmux_file}
      echo ${tmux_line} >>${tmux_file}
      echo "Extended tmux config!"
  else
      echo "Tmux already extended"
  fi
fi

mkdir -p ${HOME}/.local/share/man/man1
for f in $(find "${HOME}/.ktz.d/man1" -type f -name "*.[0-9]" 2>/dev/null); do
    install -m 0644 ${f} "${HOME}/.local/share/man/man1/"
done

echo "Configuration copied successfully!"
