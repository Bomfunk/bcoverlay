# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils subversion

DESCRIPTION="Advanced network monitor for system tray"
HOMEPAGE="http://checkgmail.sourceforge.net/"
ESVN_REPO_URI="https://checkgmail.svn.sourceforge.net/svnroot/checkgmail"
ESVN_PROJECT="checkgmail"
LICENSE="GPL-3"
SLOT="0"

KEYWORDS="~x86 ~amd64"
IUSE="crypt"

RDEPEND="dev-lang/perl[ithreads]
		dev-perl/gtk2-perl
		dev-perl/gtk2-trayicon
		dev-perl/libwww-perl
		dev-perl/Crypt-SSLeay
		dev-perl/XML-Simple
		crypt? ( dev-perl/Crypt-Simple
		perl-core/Compress-Raw-Zlib
		dev-perl/Crypt-Blowfish
		dev-perl/FreezeThaw )"
DEPEND="${RDEPEND}"

src_install() {
	dobin checkgmail
	doman man/*
	dodoc todo copying Readme ChangeLog
}
