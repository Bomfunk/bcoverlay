# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Renders images in the terminal."
HOMEPAGE="https://github.com/posva/catimg"
SRC_URI="https://github.com/posva/catimg/archive/refs/tags/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=media-gfx/imagemagick-6.6.0.4"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	cmake_src_prepare
}
src_configure() {
	cmake_src_configure
}
src_compile() {
	cmake_src_compile all
}
