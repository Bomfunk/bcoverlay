# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils python

DESCRIPTION="Ccnet is a framework for writing networked applications in C."
HOMEPAGE="https://github.com/haiwen/ccnet"
SRC_URI="https://seafile.googlecode.com/files/seafile-1.6.1.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"

IUSE=""

RDEPEND=">=dev-libs/libevent-2.0
		>=dev-db/sqlite-3.7
		net-misc/libsearpc"
DEPEND="${RDEPEND}
		dev-lang/vala
		>=dev-util/intltool-0.40"

S=${WORKDIR}/seafile-1.6.1/ccnet

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_configure() {
	SEARPC_CFLAGS="-pthread -I/usr/include -I/usr/include/searpc -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include" econf
}

src_compile() {
	MAKEOPTS="-j1" emake
}
