# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="A python package for simple access to reddit's API"
HOMEPAGE="http://praw.readthedocs.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/prawcore
		dev-python/update-checker"

DOCS=""
RESTRICT="test"
PATCHES=( "${FILESDIR}/5.2.0-no-pytest-runner.patch" )

python_test() {
	${EPYTHON} setup.py test
}
