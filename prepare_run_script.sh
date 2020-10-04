#!/bin/bash
set -e

pushd $(dirname $(realpath $0))

function handle_exit(){
    rm -f ./config_stage/payload.tar
}

trap "handle_exit" EXIT

if ! which makeself >/dev/null 2>&1; then
    echo "\`makeself\` is missing, please install it!"
    exit 1
fi

[ ! -d config_stage ] && echo "Config directory missing!" && exit 1

if [ -d config_files ]; then
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
if makeself --help | grep sha256; then
    sha="--sha256"
fi

makeself "${sha}" ./config_stage ktz-env-$(cat VERSION).run "My env autosetup" ./install.sh

