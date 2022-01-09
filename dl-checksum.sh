#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://releases.jfrog.io/artifactory/jfrog-cli


dl()
{
    local major_ver=$1
    local minor_ver=$2
    local patch_ver=$3
    local os=$4
    local arch=$5
    local dotexe=${6:-}
    local platform="${os}-${arch}"
    local fq_ver="${major_ver}.${minor_ver}.${patch_ver}"
    local url="$MIRROR/v${major_ver}/${fq_ver}/jfrog-cli-${platform}/jfrog${dotexe}"
    local verfile="jfrog-${platform}-${fq_ver}"
    local lfile=$DIR/$verfile

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `sha256sum $lfile | awk '{print $1}'`
}

dl_ver() {
    local major_ver=$1
    local minor_ver=$2
    local patch_ver=$3
    printf "  '%s.%s.%s':\n" $major_ver $minor_ver $patch_ver
    dl $major_ver $minor_ver $patch_ver linux amd64
    dl $major_ver $minor_ver $patch_ver linux 386
    dl $major_ver $minor_ver $patch_ver mac 386
    dl $major_ver $minor_ver $patch_ver windows amd64 .exe
}

dl_ver 2 10 1
