Difference between /proc and /dev in kernel implementation

/proc:
*communication between user space and kernel space
-parameter used to tuning hardware and kernel internal settings
-user program -> proc -> kernel components

Implementation:
-to create an entry under /proc in kernel
	use "create_proc_entry()"



/dev:
*communication with intention to issue I/O control or recieve I/O data via 
	read, write or mmap
-kernel will recognise these IO requests and call requested device drivers(kernel modules), which later communicate with hardware
-user program -> dev -> device driver -> hardware IO
-got major and minor number
	The kernel use the major number to redirect IO request to the 
	appropriate driver, and the driver use the minor number to figure out
	which specific device to access.
-another implementation is create named pipe usng mkfifo
	-once created /dev fifo file can used for IPC communication 
	 between 2 process no matter which spaces they live in

Implementation:
-to create an entry under /dev in kernel
	-use mknod to create character/block special file 
		-"special file" means something that can generate or recieve data
