# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:$

EAPI=1

inherit distutils

DESCRIPTION="Python library for working with CouchDB"
HOMEPAGE="http://code.google.com/p/couchdb-python/"
SRC_URI="http://pypi.python.org/packages/source/C/CouchDB/CouchDB-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

RDEPEND="dev-python/httplib2
	|| ( >=dev-lang/python-2.6
		( dev-lang/python:2.5 dev-python/simplejson )
		( dev-lang/python:2.4 dev-python/simplejson ) )
	doc? ( dev-python/epydoc )"
DEPEND=""

PYTHON_MODNAME="couchdb"
S=${WORKDIR}/CouchDB-${PV}

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${PV}-noprint.patch"
}

src_install() {
	distutils_src_install

	if use doc; then
		epydoc --config=doc/conf/epydoc.ini
	fi

	dohtml -r doc/* || die
}
