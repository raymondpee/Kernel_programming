Kernel_programming
==================
Finally the things has worked! Gawd!

1) 1st create the file as nothing.c

2) create a Makefile

3) Inside Makefile file
	obj-m += nothing.o

4) execute the command below
	make -C /lib/modules/3.2.0-23-generic-pae/build M=/home/rpee/kernel_project/a_start modules

5)later on u will have many files come out, next find the nothing.ko

6)type command "insmod" nothing.ko, then u will allow installation of module in the kernel

7) to check the module is instaled correctly, use "lsmod"

8) to remove the module, use "rmmod" nothing


*NOTE

*Take note that after u create the .c file, it is impossible for you to compile it with gcc, you must create the make file to compile it to kernel

*We are using the .ko file so that we can insert it with insmod

*obj-m means obj: object, m: module. It is a list of what kernel modules to biuld. All the .o and other objects will be automatically built from the corresponding .c file 
