# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils qt4-r2 git-2

DESCRIPTION="Advanced network monitor for system tray"
HOMEPAGE="http://bitcheese.net/wiki/code/qnetload"
EGIT_REPO_URI="git://git.bitcheese.net/qnetload"
LICENSE="GPL-3"
SLOT="0"

KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-qt/qtgui:4"
RDEPEND="${DEPEND}"

DOCS="COPYING README"

src_configure() {
	eqmake4 PREFIX="/usr"
}
