In this note we will sepearte few categories for explaination:

Implementation

1) After makefile, insmod with the chardev.ko, go to the 
	"cat /var/log/syslog"

2) Later on, from up the command, we will get the major and minor number of the device,
	(For this instance, 250, 0)

3) The device still not visible in the /dev folder
	-In order to create the file, we need to "mknod /dev/chardev c 250 0"
	-Now the /dev folder have a file name chardev

4) Next we "cat /dev/chardev"
	-We will see the output "I already told you 0 times Hello world!"
	-If we repeat cat it, the number of times will be iterated


Concept:

-The mknod command is used to create block or character special file
	-mknod /dev/chardev c 250 0 
	-c means character device (go man mknod to check out)

-Observe the "static" variable inside the command
	-it is this static calling that allowing the ietration of 
		"I already told you N times Hello world!"
	-This static variable will store the value even after the program ends (*Take note!")

-observe the static strct file
	static struct file_operations fops = {
        	.read = device_read,
        	.write = device_write,
        	.open = device_open,
        	.release = device_release
	};
	-This struct method only apply in kernel, which is used to act like 
	 virtual struct file which can be overwritten by our user function
	- The left "read" is the name of operation we want to support
	- The right "device_read" is the name of the function that will implement the operation

Kernel Concept:

-Take note that the each device represented in the kernel is by a file structure
 It is totally different than the file and never appears in a user space program

-char devices are accessed through device files, usually locate at /dev

-Major number tell you which driver handles which device file

-Minor number is used only by the drver itself to differentiate which device operating on

-Add a driver to the system means registering it with  the kernel
	int register_chrdev(unsigned int major, const char *name, struct file_operations *fops);






MISC:

This is the original struct method of the file
	struct file_operations {
	struct module *owner;
	 loff_t(*llseek) (struct file *, loff_t, int);
	 ssize_t(*read) (struct file *, char __user *, size_t, loff_t *);
	 ssize_t(*aio_read) (struct kiocb *, char __user *, size_t, loff_t);
	 ssize_t(*write) (struct file *, const char __user *, size_t, loff_t *);
	 ssize_t(*aio_write) (struct kiocb *, const char __user *, size_t,
			      loff_t);
	int (*readdir) (struct file *, void *, filldir_t);
	unsigned int (*poll) (struct file *, struct poll_table_struct *);
	int (*ioctl) (struct inode *, struct file *, unsigned int,
		      unsigned long);
	int (*mmap) (struct file *, struct vm_area_struct *);
	int (*open) (struct inode *, struct file *);
	int (*flush) (struct file *);
	int (*release) (struct inode *, struct file *);
	int (*fsync) (struct file *, struct dentry *, int datasync);
	int (*aio_fsync) (struct kiocb *, int datasync);
	int (*fasync) (int, struct file *, int);
	int (*lock) (struct file *, int, struct file_lock *);
	 ssize_t(*readv) (struct file *, const struct iovec *, unsigned long,
			  loff_t *);
	 ssize_t(*writev) (struct file *, const struct iovec *, unsigned long,
			   loff_t *);
	 ssize_t(*sendfile) (struct file *, loff_t *, size_t, read_actor_t,
			     void __user *);
	 ssize_t(*sendpage) (struct file *, struct page *, int, size_t,
			     loff_t *, int);
	unsigned long (*get_unmapped_area) (struct file *, unsigned long,
					    unsigned long, unsigned long,
					    unsigned long);
};
