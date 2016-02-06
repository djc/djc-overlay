# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from mva overlay; Bumped by mva; $

EAPI="5"

inherit eutils base git-r3

DESCRIPTION="Open, trustworthy and decentralized syncing engine (some kind of analog of DropBox and BTSync)"
HOMEPAGE="http://syncthing.net"
SRC_URI=""
EGIT_REPO_URI="https://github.com/syncthing/${PN}"
EGIT_COMMIT="v${PV}"
KEYWORDS=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="tools"

DEPEND="
	dev-lang/go
	dev-go/godep
"
RDEPEND="${DEPEND}"

DOCS=( README.md AUTHORS LICENSE CONTRIBUTING.md )

export GOPATH="${S}"

GO_PN="github.com/syncthing/${PN}"
EGIT_CHECKOUT_DIR="${S}/src/${GO_PN}"
S="${EGIT_CHECKOUT_DIR}"

src_compile() {
	# XXX: All the stuff below needs for "-version" command to show actual info
	local version="$(git describe --always | sed 's/\([v\.0-9]*\)\(-\(beta\|alpha\)[0-9]*\)\?-/\1\2+/')";
	local date="$(git show -s --format=%ct)";
	local user="$(whoami)"
	local host="$(hostname)"; host="${host%%.*}";
	local lf="-w -X main.Version ${version} -X main.BuildStamp ${date} -X main.BuildUser ${user} -X main.BuildHost ${host}"

	godep go build -ldflags "${lf}" -tags noupgrade ./cmd/syncthing

	use tools && (
		godep go build ./cmd/stcli
		godep go build ./cmd/stpidx
		godep go build ./discover/cmd/discosrv
	)
}

src_install() {
	dobin syncthing
	use tools && dobin stcli stpidx discosrv
	base_src_install_docs
}
