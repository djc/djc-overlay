# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/openvpn/openvpn-2.3.6-r2.ebuild,v 1.1 2015/02/17 18:46:07 djc Exp $

EAPI=5

inherit cmake-utils

DESCRIPTION="Robust and highly flexible tunneling application compatible with many OSes"
SRC_URI="https://github.com/vstakhov/rmilter/archive/${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/vstakhov/rmilter"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/libpcre
		mail-filter/libmilter
		mail-filter/opendkim
		mail-filter/libspf2"
RDEPEND="${DEPEND}"
