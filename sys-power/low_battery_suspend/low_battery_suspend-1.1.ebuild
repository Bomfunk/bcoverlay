# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple bash script to suspend the system based on the output of acpi.
Assumes systemctl suspend."
HOMEPAGE="https://github.com/NickHu/low_battery_suspend"
SRC_URI="https://github.com/NickHu/low_battery_suspend/archive/refs/tags/1.1.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-apps/systemd
		sys-power/acpi
		app-shells/bash"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin low_battery_suspend
	dodoc README.rst
	mkdir -p "${D}/usr/lib/systemd/system"
	cp "${S}/systemd/low_battery_suspend."{service,timer} "${D}/usr/lib/systemd/system/"
}
