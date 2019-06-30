#!/usr/bin/env sh
VER='1.26.1'
DIR=~/Downloads
MIRROR=https://api.bintray.com/content/jfrog/jfrog-cli-go/$VER


dl()
{
    OS=$1
    PLATFORM=$2
    SUFFIX=${3:-}
    UNVERFILE=jfrog-cli-$OS-$PLATFORM
    URL="$MIRROR/$UNVERFILE/jfrog${SUFFIX}?bt_package=$UNVERFILE"
    VERFILE=$UNVERFILE-$VER
    LFILE=$DIR/$VERFILE

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "  # %s\n" $URL
    printf "  %s-%s: sha256:%s\n" $OS $PLATFORM `sha256sum $LFILE | awk '{print $1}'`
}

printf "'%s':\n" $VER
dl linux amd64
dl linux 386
dl mac 386
dl windows amd64 .exe
