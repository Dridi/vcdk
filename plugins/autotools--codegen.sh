# Copyright (C) 2017  Dridi Boukelmoune
# All rights reserved.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

ac_config_files() {
cat <<EOF

AC_CONFIG_FILES([
	Makefile
	src/Makefile
EOF

OLD_IFS=$IFS
IFS=,

for v in $vut
do
	printf '\tsrc/%s.rst\n' "$v"
done

IFS=$OLD_IFS

# TODO: packaging files

cat <<EOF
])

EOF
}

configure_ac() {
cat <<EOF
AC_PREREQ([2.68])
AC_INIT([$name], [0.1])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_HEADER([config.h])

AM_INIT_AUTOMAKE([1.12 -Wall -Werror foreign parallel-tests])
AM_SILENT_RULES([yes])
AM_PROG_AR

LT_PREREQ([2.2.6])
LT_INIT([dlopen disable-static])

AC_ARG_WITH([rst2man],
	AS_HELP_STRING(
		[--with-rst2man=PATH],
		[Location of rst2man (auto)]),
	[RST2MAN="\$withval"],
	AC_CHECK_PROGS(RST2MAN, [rst2man rst2man.py], []))

VARNISH_PREREQ([5.2.0])
EOF

test -n "$vmod" &&
tr , ' ' <<EOF
VARNISH_VMODS([$vmod])
EOF

test -n "$vsc" &&
tr , ' ' <<EOF
VARNISH_COUNTERS([$vsc])
EOF

test -n "$vut" &&
tr , ' ' <<EOF
VARNISH_UTILITIES([$vut])
EOF

ac_config_files

cat <<EOF
AC_OUTPUT

AS_ECHO("
	==== \$PACKAGE_STRING ====

	varnish:      \$VARNISH_VERSION
	prefix:       \$prefix
	vmoddir:      \$vmoddir
	vcldir:       \$vcldir
	pkgvcldir:    \$pkgvcldir

	compiler:     \$CC
	cflags:       \$CFLAGS
	ldflags:      \$LDFLAGS
")
EOF
}
