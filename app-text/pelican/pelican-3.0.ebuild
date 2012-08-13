# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/pelican/pelican-2.8.1.ebuild,v 1.1 2012/07/19 08:26:38 djc Exp $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="A tool to generate a static blog, with restructured text (or markdown) input files."
HOMEPAGE="http://pelican.notmyidea.org/ http://pypi.python.org/pypi/pelican"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples markdown"

DEPEND="dev-python/blinker
		dev-python/docutils
		dev-python/feedgenerator
		dev-python/jinja
		dev-python/pygments
		dev-python/pytz
		dev-python/unidecode
		markdown? ( dev-python/markdown )
		|| ( dev-lang/python:2.7 dev-python/argparse )"
RDEPEND="${DEPEND}"

DOCS="README.rst"

src_install() {
	distutils_src_install
	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins -r samples/* || die "failed to install examples"
	fi
}

# no tests: tox.ini not in tarball for 3.0
# for 3.0.1, should be based on tox (refer to virtualenvwrapper)
