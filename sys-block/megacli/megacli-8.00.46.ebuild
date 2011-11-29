# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-block/megacli/megacli-8.00.46.ebuild,v 1.1 2011/05/26 18:12:27 ramereth Exp $

EAPI="4"

inherit rpm multilib

DESCRIPTION="LSI Logic MegaRAID Command Line Interface management tool"
HOMEPAGE="http://www.lsi.com/"
SRC_URI="http://www.lsi.com/downloads/Public/MegaRAID%20Common%20Files/${PV}_Linux_MegaCLI.zip"

LICENSE="LSI"
SLOT="0"
# This package can never enter stable, it can't be mirrored and upstream
# can remove the distfiles from their mirror anytime.
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

RESTRICT="strip mirror test"

S=${WORKDIR}

src_unpack() {
	unpack ${A}
	cd "${S}"
	unpack ./MegaCliLin.zip || die
	rpm_unpack ./MegaCli-${PV}-1.i386.rpm || die
	rpm_unpack ./Lib_Utils-1.00-08.noarch.rpm || die
}

src_prepare() {
	libsysfs=libsysfs.so.2.0.2
	case ${ARCH} in
		amd64) MegaCli=MegaCli64 libsysfs_path="x86_64/${libsysfs}";;
		x86) MegaCli=MegaCli;;
		*) die "invalid ARCH";;
	esac
	export MegaCli libsysfs libsysfs_path
}

src_compile() {
	echo "Nothing to compile."
}

src_install() {
	exeinto /opt/MegaRAID/MegaCli
	doexe opt/MegaRAID/MegaCli/${MegaCli}
	dosym /opt/MegaRAID/MegaCli/${MegaCli} usr/sbin/MegaCli
	dosym /opt/MegaRAID/MegaCli/${MegaCli} usr/sbin/megacli
	dosym ${libsysfs} usr/$(get_libdir)/libsysfs.so.2
	dolib.so opt/lsi/3rdpartylibs/${libsysfs_path}
	dodoc ${PV}_Linux_MegaCLI.txt
}

pkg_postinst() {
	einfo
	einfo "See ${PV}_Linux_MegaCli.txt for a list of supported controllers"
	einfo "(contains LSI model names only, not those sold by 3rd parties"
	einfo "under custom names like Dell PERC etc)."
	einfo
	einfo "As there's no dedicated manual, you might want to have"
	einfo "a look at the following cheat sheet (originally written"
	einfo "for Dell PowerEdge Expandable RAID Controllers):"
	einfo "http://tools.rapidsoft.de/perc/perc-cheat-sheet.html"
	einfo
	einfo "For more information about working with Dell PERCs see:"
	einfo "http://tools.rapidsoft.de/perc/"
	einfo
}
