cmd_/home/rpee/kernel_project/helloworld/hello.ko := ld -r -m elf_i386 -T /usr/src/linux-headers-3.2.0-23-generic-pae/scripts/module-common.lds --build-id  -o /home/rpee/kernel_project/helloworld/hello.ko /home/rpee/kernel_project/helloworld/hello.o /home/rpee/kernel_project/helloworld/hello.mod.o