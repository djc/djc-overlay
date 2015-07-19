# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/python/python-3.3.5-r1.ebuild,v 1.12 2015/03/31 18:46:33 djc Exp $

EAPI=5

inherit cmake-utils

DESCRIPTION="Rapid spam filtering system"
SRC_URI="https://rspamd.com/downloads/${P}.tar.xz"
HOMEPAGE="https://github.com/vstakhov/rspamd"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/libpcre
		mail-filter/libmilter
		mail-filter/opendkim
		mail-filter/libspf2
		dev-lang/luajit:2
		dev-libs/libevent
		dev-db/sqlite:3
		dev-libs/glib:2
		dev-libs/gmime
		dev-libs/hiredis"
RDEPEND="${DEPEND}"
