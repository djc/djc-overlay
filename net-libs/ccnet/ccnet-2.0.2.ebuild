# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils

DESCRIPTION="Ccnet is a framework for writing networked applications in C."
HOMEPAGE="https://github.com/haiwen/ccnet"
SRC_URI="http://seafile.googlecode.com/files/seafile-server-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="client mysql server"

DEPEND="dev-lang/vala
		net-lib/libsearpc
		dev-db/libzdb
		dev-db/sqlite"
RDEPEND="${DEPEND}"

S="${WORKDIR}/seafile-${PV}/ccnet"

src_prepare() {
	epatch "${FILESDIR}/system-json-glib.patch"
	find -name "Makefile.am" | xargs sed -i 's/@GLIB2_CFLAGS@/@GLIB2_CFLAGS@ @JSONGLIB_CFLAGS@/'
	find -name "Makefile.am" | xargs sed -i 's/@GLIB2_LIBS@/@GLIB2_LIBS@ @JSONGLIB_LIBS@/'
	eautoreconf
}

src_configure() {
	econf --enable-console --disable-compile-demo \
			$(use_enable server) \
			$(use_enable client)
}

src_compile() {
	emake -j1
}
