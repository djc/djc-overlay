# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/rpy/rpy-0.99.2.ebuild,v 1.3 2007/06/26 02:00:06 mr_bones_ Exp $

inherit distutils

MY_P="${P/_rc/-RC}"
DESCRIPTION="RPy is a very simple, yet robust, Python interface to the R Programming Language."
HOMEPAGE="http://rpy.sourceforge.net"
SRC_URI="mirror://sourceforge/rpy/${MY_P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~x86"
IUSE=""
DEPEND="virtual/python
	>=dev-lang/R-2.3
	dev-python/numpy"

src_unpack() {
	unpack ${A}
	S="${WORKDIR}"/${MY_P}
	cd "$S"
	epatch ${FILESDIR}/${P}-version-detect.patch

}

src_compile() {
	cd $MY_P
	distutils_src_compile
}

src_install() {
	distutils_src_install
	# add R libs to ld.so.conf
	doenvd "${FILESDIR}/90rpy"
}

pkg_postinst() {
	env-update
}
