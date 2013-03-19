# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/wtforms/wtforms-1.0.3-r1.ebuild,v 1.1 2013/03/16 08:46:43 idella4 Exp $

EAPI="5"
PYTHON_COMPAT=( python{2_6,2_7,3_1,3_2,3_3} )

inherit distutils-r1

MY_PN="update_checker"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A python module that will check for package updates"
HOMEPAGE="https://github.com/bboe/update_checker"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

S="${WORKDIR}/${MY_P}"

DEPEND="dev-python/setuptools"
RDEPEND=">=dev-python/requests-1.0.2"

DOCS="README.md"
