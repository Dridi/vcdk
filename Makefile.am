#!/bin/sh
#
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

bin_SCRIPTS = vcdk
libexec_SCRIPTS = vcdk-setup.sh
vcdk_SCRIPTS = plugins/autotools

vcdk_DATA = \
	plugins/vcdk.m4 \
	plugins/autotools--codegen.sh

vcdk: vcdk.in
	$(SED) \
		-e 's:[@]vcdkdir[@]:$(vcdkdir):' \
		-e 's:[@]libexecdir[@]:$(libexecdir):' \
		<'$(srcdir)/vcdk.in' >vcdk
	chmod +x vcdk

CLEANFILES = vcdk

EXTRA_DIST = \
	$(libexec_SCRIPTS) \
	$(vcdk_SCRIPTS) \
	$(vcdk_DATA) \
	vcdk.in \
	vcdk.spec
