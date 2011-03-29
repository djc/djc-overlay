# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/wtforms/wtforms-0.6.2.ebuild,v 1.3 2011/03/21 10:18:49 tomka Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_PN="Supay"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="http://pypi.python.org/pypi/Supay/"
HOMEPAGE="http://code.google.com/p/supay/ http://pypi.python.org/pypi/Supay"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${MY_P}"

DEPEND=""
RDEPEND=""
