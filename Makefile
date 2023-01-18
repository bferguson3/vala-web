# run me sudo 

default:
	mkdir -p build
	valac -C --vapidir=./vapi --pkg emscripten *.vala 
	@mv *.c build/
	cd build && emcc \
		-I../glib-wasm/include/glib-2.0 \
		-I../glib-wasm/lib/glib-2.0/include \
		-L../glib-wasm/lib \
		-lglib-2.0 -lffi -lgio-2.0 -lgmodule-2.0 -lgobject-2.0 -lgthread-2.0 -lz \
		-v \
		./*.c \
		-o index.html 
run:
	emrun index.html --browser="/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe"

clean:
	rm -rf build 