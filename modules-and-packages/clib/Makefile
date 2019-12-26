cc=gcc --std=c99
luasrc=../../lua-src


clib.so: clib.o clib2.o #This put serveral submodules together.
	cc -shared $^ -o $@

%.o: %.c
	cc -c $< -o $@ -I$(luasrc) -fPIC

clean: 
	rm -rf *.so *.o
