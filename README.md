# vala-web 

glib-wasm/ contains pre-built binaries of GLib 2.75.
These binaries pretty much ONLY build on a specific docker container running Linux or WSL. 
MacOS is out of luck; all available libraries on cocoashit are purposefully not compatible with GNU any longer. 
Valac, emcc is fine for project code, but libs CANNOT be built on Mac! That's why they are included!
