# Copyright (c) 2009, 2011 Richard Kettlewell.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

INSTALL=install

all:

adduser:
	adduser --system --home /var/local/p4 --group p4d

install:
	$(INSTALL) -m 755 p4.init /etc/init.d/p4

uninstall:
	rm -f /etc/init.d/p4

activate:
	update-rc.d p4 defaults 92 19
	/etc/init.d/p4 start

deactivate:
	/etc/init.d/p4 stop
	update-rc.d p4 remove
