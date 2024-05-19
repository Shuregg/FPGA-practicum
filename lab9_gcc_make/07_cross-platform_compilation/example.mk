CC        := g++
TOOLCHAIN := arm-linux-gnueabihf-
PT        :=
CFL       := -Wextra -std=c++11
TPATH     := ~/toolchain/gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf/bin/
LPATH     := ~/toolchain/sysroot-glibc-linaro-2.21-2016.05-arm-linux-gnueabihf/
ARCH      := -march=armv7-a -mcpu=cortex-a5 --sysroot=$(LPATH)

native: slc.cpp
        $(CC) $(CFL) -o eval slc.cpp

cross: slc.cpp
        $(TPATH)$(TOOLCHAIN)$(CC) $(CFL) $(ARCH) slc.cpp -o acalc -static

clear:
        rm -f *.o
        rm -f eval