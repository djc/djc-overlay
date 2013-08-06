# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_5,2_6,2_7} )
PYTHON_REQ_USE="sqlite"

inherit autotools eutils python-r1

DESCRIPTION="A better place for managing documents together."
HOMEPAGE="https://github.com/haiwen/seafile"
SRC_URI="http://seafile.googlecode.com/files/seafile-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="client gui mysql server"

RDEPEND="dev-python/simplejson
			${PYTHON_DEPS}"
DEPEND="net-libs/ccnet
		sys-devel/gettext
		dev-util/pkgconfig"

src_prepare() {
	rm -r libsearpc ccnet
	epatch "${FILESDIR}/system-json.patch"
	find -name "Makefile.am" | xargs sed -i 's/@SEARPC_CFLAGS@/@SEARPC_CFLAGS@ @JSONGLIB_CFLAGS@/'
	find -name "Makefile.am" | xargs sed -i 's/@SEARPC_LIBS@/@SEARPC_LIBS@ @JSONGLIB_LIBS@/'
	eautoreconf
}

src_configure() {
	econf $(use_enable client) \
		$(use_enable server) \
		$(use_enable gui) \
		$(use_enable mysql)
}

src_compile() {
	emake -j1
}
