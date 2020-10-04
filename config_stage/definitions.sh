
#OS_NAME=$(sed -n -e 's/^NAME="\(.*\)"/\1/p' /etc/os-release)
#if which yum >/dev/null 2>&1; then
#    OS_NAME="RHEL"
#elif which apt >/dev/null 2>&1; then
#    OS_NAME="UBUNTU"
#fi
