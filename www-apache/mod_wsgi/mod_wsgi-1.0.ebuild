# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apache/mod_wsgi/mod_wsgi-1.0.ebuild,v 1.1 2007/09/08 17:28:09 hollow Exp $

inherit apache-module

MY_P="${P/_r/}"

DESCRIPTION="An Apache2 module for running Python WSGI applications."
HOMEPAGE="http://code.google.com/p/modwsgi/"
SRC_URI="http://modwsgi.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/python-2.4"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}

APACHE2_MOD_CONF="70_${PN}"
APACHE2_MOD_DEFINE="WSGI"

DOCFILES="README"

need_apache2

src_compile() {
	econf --with-apxs=${APXS2} || die "econf failed"
	emake OPT="$(apxs2 -q CFLAGS) -fPIC" || die "econf failed"
}
