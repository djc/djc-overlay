# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/wtforms/wtforms-0.6.3.ebuild,v 1.3 2012/02/24 15:21:36 phajdan.jr Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Standalone version of django.utils.feedgenerator"
HOMEPAGE="http://pypi.python.org/pypi/feedgenerator"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND=""
RDEPEND=""

#DOCS="AUTHORS.txt CHANGES.txt README.txt"

src_test() {
	cd tests
	testing() {
		"$(PYTHON)" runtests.py
	}
	python_execute_function testing
}
