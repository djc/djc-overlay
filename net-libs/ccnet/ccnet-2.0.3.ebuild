# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit autotools eutils vala python-single-r1

DESCRIPTION="Ccnet is a framework for writing networked applications in C."
HOMEPAGE="https://github.com/haiwen/ccnet"
SRC_URI="https://github.com/haiwen/${PN}/archive/v${PV}-server.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="client server"

DEPEND="dev-lang/vala
		net-libs/libsearpc
		>=dev-libs/glib-2.0
		>=dev-lang/vala-0.8
		dev-db/libzdb
		dev-db/sqlite"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}-server"

src_prepare() {
	vala_src_prepare
	epatch "${FILESDIR}/system-json-glib.patch"
	find -name "Makefile.am" | xargs sed -i 's/@GLIB2_CFLAGS@/@GLIB2_CFLAGS@ @JSONGLIB_CFLAGS@/'
	find -name "Makefile.am" | xargs sed -i 's/@GLIB2_LIBS@/@GLIB2_LIBS@ @JSONGLIB_LIBS@/'
	find -name "Makefile.am" | xargs sed -i 's/valac/${VALAC}/' # ugly hack
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
