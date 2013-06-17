# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils python git-2

DESCRIPTION="A simple and easy-to-use C language RPC framework (including both server side & client side) based on GObject System. Python binding is also provided"
HOMEPAGE="https://github.com/haiwen/libsearpc"
EGIT_REPO_URI="https://github.com/haiwen/libsearpc.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}
