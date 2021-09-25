#!/usr/bin/env bash
# bin/compile <build-dir> <cache-dir>

set -e
set -o pipefail

head() {
  echo ""
  echo "-----> $*"
}

indent() {
  c='s/^/       /'
  case $(uname) in
    Darwin) sed -l "$c";; # mac/bsd sed: -l buffers on line boundaries
    *)      sed -u "$c";; # unix/gnu sed: -u unbuffered (arbitrary) chunks of data
  esac
}

build_dir=$(readlink -f $1)
cache_dir=$(readlink -f $2)
env_dir=$3

base_dir=$cache_dir/proxychains-ng
source_dir=$base_dir/source
mkdir -p $base_dir

if [[ ! -d $source_dir ]]; then
   head "Fetching ProxyChains sources"
   git clone https://github.com/rofl0r/proxychains-ng.git $source_dir 2>&1 | indent
else
    head "Updating cached ProxyChains sources"
    pushd $source_dir > /dev/null
    git clean -fd . 2>&1 | indent
    git checkout master 2>&1 | indent
    git pull --rebase 2>&1 | indent
    popd > /dev/null
fi

pushd $source_dir > /dev/null
version_tag=$(git describe --tags| cut -d- -f1)
cached_build_dir=$base_dir/proxychains-ng-$version_tag

if [[ ! -d $cached_build_dir ]]; then
    head "Building ProxyChains $version_tag"
    make clean 2>&1 | indent
    git checkout $version_tag 2>&1 | indent
    ./configure --prefix=/app/vendor/proxychains-ng 2>&1 | indent
    make 2>&1 | indent
    DESTDIR=$cached_build_dir make install 2>&1 | indent
fi
popd > /dev/null

head "Installing ProxyChains into the slug"
mkdir -p $build_dir/.profile.d 2>&1 | indent
rm -f $build_dir/.profile.d/proxychains-ng.sh 2>&1 | indent
echo 'export PATH="/app/vendor/proxychains-ng/bin:$PATH"' >> $build_dir/.profile.d/proxychains-ng.sh 2>&1 | indent
echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/app/vendor/proxychains-ng/lib";' >> $build_dir/.profile.d/proxychains-ng.sh 2>&1 | indent

pushd $cached_build_dir/app > /dev/null
cp -rv ./ $build_dir 2>&1 | indent
popd > /dev/null

exit 0
