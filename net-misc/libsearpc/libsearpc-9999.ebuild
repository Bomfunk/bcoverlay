# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2"
PYTHON_COMPAT=( python2 )
RESTRICT_PYTHON_ABIS="3.*"
inherit eutils python git-2

DESCRIPTION="A simple and easy-to-use C language RPC framework (including both server side & client side) based on GObject System. Python binding is also provided"
HOMEPAGE="https://github.com/haiwen/libsearpc"
EGIT_REPO_URI="https://github.com/haiwen/libsearpc.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_configure() {
	./autogen.sh
	econf
}

src_prepare() {
	python_convert_shebangs -r 2 .
}

src_configure() {
	MAKEOPTS="-j1" econf
}
