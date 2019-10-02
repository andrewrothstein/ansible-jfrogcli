#!/usr/bin/env sh
VER=1.29.1
DIR=~/Downloads
MIRROR=https://api.bintray.com/content/jfrog/jfrog-cli-go/$VER


dl()
{
    local os=$1
    local arch=$2
    local suffix=${3:-}
    local unverfile=jfrog-cli-$os-$arch
    local url="$MIRROR/$unverfile/jfrog${suffix}?bt_package=$unverfile"
    local verfile=$unverfile-${VER}
    local lfile=$DIR/$verfile

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s-%s: sha256:%s\n" $os $arch `sha256sum $lfile | awk '{print $1}'`
}

printf "  '%s':\n" $VER
dl linux amd64
dl linux 386
dl mac 386
dl windows amd64 .exe
