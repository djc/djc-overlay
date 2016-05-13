# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
PYTHON_COMPAT=( python{2_6,2_7,3_1,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="A python package for simple access to reddit's API"
HOMEPAGE="http://praw.readthedocs.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-python/decorator-3.4.2
		>=dev-python/requests-2.3.0
		>=dev-python/six-1.4
		>=dev-python/update-checker-0.11"

DOCS=""
PATCHES=( "${FILESDIR}/${PV}-dep-ranges.patch" )
RESTRICT="test"

python_test() {
	${EPYTHON} setup.py test
}