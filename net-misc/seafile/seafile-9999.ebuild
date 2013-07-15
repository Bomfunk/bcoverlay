# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2"
PYTHON_COMPAT=( python2 )
RESTRICT_PYTHON_ABIS="3.*"
inherit eutils python git-2 vala

DESCRIPTION="A file syncing and collaboration platform for teams."
HOMEPAGE="http://seafile.com/"
EGIT_REPO_URI="https://github.com/haiwen/seafile.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

IUSE="X vala"
REQUIRED_USE="vala"

RDEPEND="X? ( x11-libs/libnotify
		>=x11-libs/gtk+-2.24:2 )
		>=dev-libs/openssl-1.0
		dev-python/webpy
		dev-python/simplejson
		dev-python/mako
		=net-misc/ccnet-9999"
DEPEND="${RDEPEND}
		vala? ( dev-lang/vala )
		sys-kernel/linux-headers"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	python_convert_shebangs -r 2 .
	use vala && vala_src_prepare
	sed -e 's/valac/$(VALAC)/g' -i ./lib/Makefile.am
}

src_configure() {
	./autogen.sh
	PYTHON="$(PYTHON)" econf $(use_enable X gui)
}

src_compile() {
	MAKEOPTS="-j1" emake
}
