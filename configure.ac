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

AC_PREREQ([2.68])
AC_INIT([vcdk],
	[0.1],
	[https://github.com/dridi/vcdk/issues],
	[vcdk],
	[https://github.com/dridi/vcdk])
AC_COPYRIGHT([Copyright (C) 2017  Dridi Boukelmoune])
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_SRCDIR([vcdk.in])
AC_PROG_SED

AM_INIT_AUTOMAKE([1.12 -Wall -Werror foreign parallel-tests])

AC_SUBST([vcdkdir], [$libexecdir/vcdk])

AC_CONFIG_FILES([
	Makefile
	vcdk.spec
])

AC_OUTPUT
