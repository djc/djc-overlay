# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit python eutils autotools

DESCRIPTION="QuickFIX is a full-featured open source FIX engine."
HOMEPAGE="http://quickfixengine.org/"
SRC_URI="http://dirkjan.ochtman.nl/files/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="python"

RDEPEND="dev-libs/libxml2"
DEPEND="${RDEPEND}
		virtual/libstdc++"

S=${WORKDIR}/${PN}

src_prepare() {
	cd $S
	epatch ${FILESDIR}/${PV}-destdir.patch
	epatch ${FILESDIR}/${PV}-python.patch
	chmod 755 bootstrap
	eautoreconf
}

src_configure() {
	local myconf=""
	if use python; then
		myconf="${myconf} --with-python=$(python_get_includedir)"
	fi
	econf ${myconf}
}

src_install() {
	emake DESTDIR="${D}" install || die "fail"
}

