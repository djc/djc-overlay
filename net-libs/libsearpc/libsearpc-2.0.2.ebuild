# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils

DESCRIPTION="Searpc is a simple C language RPC framework based on GObject system."
HOMEPAGE="https://github.com/haiwen/libsearpc"
SRC_URI="http://seafile.googlecode.com/files/seafile-server-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/glib"
DEPEND="${RDEPEND}"

S="${WORKDIR}/seafile-${PV}/libsearpc"

src_prepare() {
	rm -r json-glib
	epatch "${FILESDIR}/system-json.patch"
	sed -i 's/(DESTDIR)//' libsearpc.pc.in
	sed -i 's/ -lsearpc-json-glib//' libsearpc.pc.in
	eautoreconf
}

src_configure() {
	econf --disable-compile-demo
}
