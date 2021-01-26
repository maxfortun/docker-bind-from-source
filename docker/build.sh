#!/bin/ash -ex

CK_VERSION=0.7.0
apk update
apk --update add \
	autoconf \
	automake \
	build-base \
	ccache \
	cmocka-dev \
	curl \
	fstrm-dev \
	geoip-dev \
	git \
	json-c-dev \
	krb5-dev \
	kyua \
	libcap-dev \
	libmaxminddb-dev \
	libtool \
	libxml2-dev \
	libuv-dev \
	libxslt \
	lmdb-dev \
	make \
	openssl-dev \
	perl \
	perl-digest-hmac \
	perl-json \
	perl-net-dns \
	perl-xml-simple \
	protobuf-c-dev \
	py3-dnspython \
	py3-ply \
	python3 \
	tzdata

mkdir /usr/src
pushd /usr/src

if [ ! -d $CK_VERSION ]; then
    curl -sSLO https://github.com/concurrencykit/ck/archive/$CK_VERSION.tar.gz
    tar -xz $CK_VERSION.tar.gz
    pushd ck-$CK_VERSION
    ./configure --prefix=/usr
    make
    make install
fi

ldconfig

git clone https://gitlab.isc.org/isc-projects/bind9.git
autoreconf -fi
./configure
make

