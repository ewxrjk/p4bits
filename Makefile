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
