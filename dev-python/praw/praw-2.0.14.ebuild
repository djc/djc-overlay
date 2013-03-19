# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/wtforms/wtforms-1.0.3-r1.ebuild,v 1.1 2013/03/16 08:46:43 idella4 Exp $

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
RDEPEND=">=dev-python/requests-1.0.3
		dev-python/six
		>=dev-python/update-checker-0.5"

DOCS=""
