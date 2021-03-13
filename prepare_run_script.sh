#!/bin/bash
set -e
Red='\033[0;31m'
NC='\033[0m'

function handle_error(){
    lc="$BASH_COMMAND"
    rc=$?
    echo ""
    echo -e "${Red}Error in line $1"
    echo "Last command was [$lc] returned with code $rc"
    echo -e -n "${NC}"
    trap "" EXIT
    exit 1
}

trap "handle_error $LINENO $?" ERR

pushd $(dirname $(realpath $0))

if ! which makeself >/dev/null 2>&1; then
    echo "\`makeself\` is missing, please install it!"
    exit 1
fi

[ ! -d config_stage ] && echo "Config directory missing!" && exit 1

if [ -d config_files ]; then
    cp VERSION config_files/.ktz.d/
    tar -cvf payload.tar -C config_files/ .
    echo "Packing payload."
    mv payload.tar config_stage/ && echo "Payload loaded."
else
    echo "No payload directory, skipping..."
fi

ins_scr="config_stage/install.sh"
[ ! -e ${ins_scr} ] && echo "Missing installation script, exiting!" && exit 1
[ ! -x ${ins_scr} ] && chmod +x ${ins_scr}

sha=""
if makeself --help | grep sha256 >/dev/null; then
    sha="--sha256"
fi

makeself $sha config_stage ktz-env-$(cat VERSION).run "My env autosetup" ./install.sh
rm -f ./config_files/.ktz.d/VERSION
rm -f ./config_stage/payload.tar
echo "Run script produced!"
