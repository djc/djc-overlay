# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils eutils

DESCRIPTION="A library to execute a function when a specific event occurs on a file descriptor"
HOMEPAGE="http://libevent.org/"
SRC_URI="https://github.com/ellzey/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/openssl
		dev-libs/oniguruma"
DEPEND="${DEPEND}"

DOCS=( README.markdown )

src_prepare() {
	rm -r oniguruma
	epatch "${FILESDIR}/system-oniguruma.patch"
}
