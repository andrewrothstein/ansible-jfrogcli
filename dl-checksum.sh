#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://api.bintray.com/content/jfrog/jfrog-cli-go


dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local suffix=${4:-}
    local unverfile=jfrog-cli-$os-$arch
    local url="$MIRROR/$ver/$unverfile/jfrog${suffix}?bt_package=$unverfile"
    local verfile=$unverfile-${ver}
    local lfile=$DIR/$verfile

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s-%s: sha256:%s\n" $os $arch `sha256sum $lfile | awk '{print $1}'`
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver linux amd64
    dl $ver linux 386
    dl $ver mac 386
    dl $ver windows amd64 .exe
}

dl_ver ${1:-1.39.2}
