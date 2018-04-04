all:
	cd pythonpath; make
	cat description.xml.in | bin/shellhtml >description.xml
	cd web; make
	cp src/Soros.py web/webroot
	cp src/Soros.js web/webroot
	cp doc/*.pdf web/webroot

dist:
	make
	cd web; make clean
	cd test; make clean
	tar c . | gzip > ../numbertext-`head -1 VERSION`.tar.gz

ooo:
	make
	zip -r numbertext-`head -1 VERSION`.oxt META-INF rdb idl pythonpath *.xcu *py *xml README

check:
	cd test; make

clean:
	rm -f *~ */*~
	cd pythonpath; make clean
	cd web; make clean
	rm -f *~ */*~
