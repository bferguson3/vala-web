# run me sudo 

UNAME:=$(shell uname)
ifeq ($(UNAME),Darwin)
$(error THIS WILL NOT WORK ON MACOS! USE UBUNTU/WSL!!)
endif

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
	emrun index.html

clean:
	rm -rf build 
