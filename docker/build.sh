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
cd /usr/src

if [ ! -d $CK_VERSION ]; then
    git clone https://github.com/concurrencykit/ck.git
    cd ck
    ./configure --prefix=/usr
    make
    make install
    cd -
fi

git clone https://gitlab.isc.org/isc-projects/bind9.git
cd bind9
autoreconf -fi
./configure
find /usr/local/src/bind9 -name '*.patch' | while read patch; do
    source=/usr$(echo $patch | sed -e 's#^/usr/local##g' -e 's#.patch$##g')
    patch -b $source $patch
done
make
make install


