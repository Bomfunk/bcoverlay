# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2"
PYTHON_COMPAT=( python2 )
RESTRICT_PYTHON_ABIS="3.*"
inherit eutils python git-2 vala

DESCRIPTION="Ccnet is a framework for writing networked applications in C."
HOMEPAGE="https://github.com/haiwen/ccnet"
EGIT_REPO_URI="https://github.com/haiwen/ccnet.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

IUSE="vala"
REQUIRED_USE="vala"

RDEPEND="${PYTHON_DEPS}
		>=dev-libs/libevent-2.0
		>=dev-db/sqlite-3.7
		=net-misc/libsearpc-9999"
DEPEND="${RDEPEND}
		vala? ( dev-lang/vala )
		>=dev-util/intltool-0.40"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	use vala && vala_src_prepare
	sed -e 's/valac/$(VALAC)/g' -i ./lib/Makefile.am
}

src_configure() {
	./autogen.sh
	SEARPC_CFLAGS="-pthread -I/usr/include -I/usr/include/searpc -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include" econf
}

src_compile() {
	MAKEOPTS="-j1" emake
}
