# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2"
PYTHON_COMPAT=( python2 )
RESTRICT_PYTHON_ABIS="3.*"
inherit eutils python

DESCRIPTION="A file syncing and collaboration platform for teams."
HOMEPAGE="http://seafile.com/"
SRC_URI="https://seafile.googlecode.com/files/seafile-client-2.0.6.tar.gz http://dump.bitcheese.net/files/axovogo/seafile-client-2.0.6.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"

IUSE="X"

RDEPEND="${PYTHON_DEPS}
		X? ( x11-libs/libnotify
		>=x11-libs/gtk+-2.24:2 )
		>=dev-libs/openssl-1.0
		dev-python/webpy
		dev-python/simplejson
		dev-python/mako
		=net-misc/ccnet-2.0.6"
DEPEND="${RDEPEND}
		sys-kernel/linux-headers"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	python_convert_shebangs -r 2 .
}

src_configure() {
	PYTHON="$(PYTHON)" econf $(use_enable X gui)
}

src_compile() {
	MAKEOPTS="-j1" emake
}
