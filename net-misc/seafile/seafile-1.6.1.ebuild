# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils python

DESCRIPTION="A file syncing and collaboration platform for teams."
HOMEPAGE="http://seafile.com/"
SRC_URI="https://seafile.googlecode.com/files/seafile-1.6.1.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"

IUSE="gui"

RDEPEND="gui? ( x11-libs/libnotify
		>=x11-libs/gtk+-2.24:2 )
		>=dev-libs/openssl-1.0
		dev-python/webpy
		dev-python/simplejson
		dev-python/mako
		net-misc/ccnet"
DEPEND="${RDEPEND}
		sys-kernel/linux-headers"

#S=${WORKDIR}/${S}

src_configure() {
	econf $(use_enable gui)
}

src_compile() {
	MAKEOPTS="-j1" emake
}