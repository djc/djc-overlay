# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils distutils

DESCRIPTION="Apache CouchDB is a distributed, fault-tolerant and schema-free document-oriented database."
HOMEPAGE="http://couchdb.apache.org/"
SRC_URI="http://build.couchdb.org/apache-couchdb-20090319090301.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
RESTRICT="test mirror" #72375

RDEPEND="dev-libs/icu
		dev-lang/erlang
		>=dev-libs/openssl-0.9.8j
		>=net-misc/curl-7.18.2
		dev-lang/spidermonkey"

DEPEND="${RDEPEND}"

S="${WORKDIR}/apache-${P/_alpha/a}"

pkg_setup() {
	enewgroup couchdb
	enewuser couchdb -1 /bin/bash /var/lib/couchdb couchdb
}

src_compile() {
	econf --with-erlang=/usr/lib/erlang/usr/include --prefix=/usr \
		--localstatedir=/var || die "configure failed"
	emake || die "make failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"

	insinto /var/run/couchdb

	fowners couchdb:couchdb \
		/var/run/couchdb \
		/var/lib/couchdb \
		/var/log/couchdb

	newinitd "${FILESDIR}/couchdb.init-0.9" couchdb || die
	newconfd "${FILESDIR}/couchdb.conf-0.9" couchdb || die
}
