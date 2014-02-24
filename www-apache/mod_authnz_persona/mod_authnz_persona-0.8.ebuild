# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apache/mod_wsgi/mod_wsgi-3.4-r1.ebuild,v 1.3 2014/02/24 01:54:36 phajdan.jr Exp $

EAPI="5"

inherit apache-module eutils

DESCRIPTION="An Apache2 module for easy Persona authentication"
HOMEPAGE="https://github.com/mozilla/mod_authnz_persona"
SRC_URI="https://github.com/mozilla/mod_authnz_persona/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/yajl
		net-misc/curl"
RDEPEND="${DEPEND}"

APACHE2_MOD_CONF="70_${PN}"
APACHE2_MOD_DEFINE="AUTHNZ_PERSONA"
APACHE2_MOD_FILE="${S}/build/.libs/${PN}.so"

DOCFILES="README.md"

need_apache2

src_compile() {
	emake APXS_PATH="${APXS}" all
}
