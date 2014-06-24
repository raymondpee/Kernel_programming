Finally this take time, no thanks to the new defination of the ioctl method!

Implementation:
1) create chardev.c, then make it like always

2) create ioctls.c, then using the gcc method to create ioctl

3) After execute, insmod of the chardev.ko

4) create the special file of the char_dev in same directory, ie mknod char_dev c 100 0
	(Take note that the name, major and minor number has been defined inside the chardev.c)

5) Then execute the ./ioctl file
	-The output is 
		get_nth_byte message:qa (The fix still need in here from the chardev.c)

		get_msg message:qa
	
	-Take note the output is qa because we have defined it in the ioctl.c file



Theory:
1) In this implementation we are trying to send command from the user space to kernel space
	-The user space is the ioctl file, which is compiled with gcc
	-The kernel space is the chardev.ko file, which we insmod inside the kernel
	-The special file (char_dev) is the 'middle man" to store the value of the 
	 user space data and 

	*Therefore whatever written in ioctl file, it will go to char_dev 
	 and come back to ioctl file.
