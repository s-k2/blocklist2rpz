blocklists2rpz:
	echo "run 'make install' or 'make deb' and install debian-package"

install:
	cp blocklists2rpz /usr/local/bin/blocklists2rpz

deb: debian/blocklists2rpz-0.1.0.deb
debian/blocklists2rpz-0.1.0.deb: blocklists2rpz debian/control
	tar -czf debian/data.tar.gz blocklists2rpz --transform 's,^,usr/bin/,'
	tar -czf debian/control.tar.gz debian/control --transform 's,^debian/,,'
	echo 2.0 >debian/debian-binary
	ar -r $@ debian/debian-binary debian/control.tar.gz debian/data.tar.gz
