# Copyright 1999-2008 Patrick Hahn / Vicente Jimenez Aguilar / Lars Strojny
# Distributed under the terms of the GNU General Public License v2

inherit distutils versionator

DESCRIPTION="Apache CouchDB is a distributed, fault-tolerant and schema-free
document-oriented database accessible via a RESTful HTTP/JSON API.
Among other features, it provides robust, incremental replication with
bi-directional conflict detection and resolution, and is queryable and
indexable using a table-oriented view engine with JavaScript acting as the
default view definition language."
HOMEPAGE="http://incubator.apache.org/couchdb/"
SRC_URI="http://build.couchdb.org/apache-couchdb-20081202110201.tar.gz"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
RESTRICT="test nomirror" #72375

RDEPEND="dev-libs/icu
		dev-lang/erlang
		dev-util/svn2cl
		dev-lang/spidermonkey"
DEPEND="${RDEPEND}"

S=${WORKDIR}/apache-${P/_alpha/a}-incubating

pkg_setup() {
	enewgroup couchdb
	enewuser couchdb -1 /bin/bash /var/lib couchdb
}

src_unpack() {
	unpack ${A}
	cd ${S}
}

src_compile() {
	econf \
		--with-erlang=/usr/lib/erlang/usr/include \
		--localstatedir="/var" || die
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"

	touch couchdb.pid
	insinto /var/run/couchdb
	doins couchdb.pid

	fowners couchdb:couchdb \
		/var/run/couchdb \
		/var/run/couchdb/couchdb.pid \
		/var/lib/couchdb \
		/var/log/couchdb

	newinitd "${FILESDIR}/couchdb.init-0.9" couchdb || die
	newconfd "${FILESDIR}/couchdb.conf-0.9" couchdb || die
}
