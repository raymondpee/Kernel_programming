To implement this example

1) After insmod, use the "cat /proc/helloworld"
   - output :Helloword!


Idea:

- The idea of the implementation is that instead it is at the /dev folder,
  This time it is locate at the /proc folder
- procfs is means (process filesystem), which is filesystem in memory.
- many process store information about themselves on this virtual filesystem

**Procfs is an interface that provides direct access to the kernel space. 
	-By using proc, many application in userspace can access the kernelspace.

-/proc/{pid} 
 -If a process with process ID (PID) of 375 starts,
  then the folder of "375" is created in proc (proc/375/)
	-This folder contains various fles wth attribute information 
		-sessionid, control groups, status, timers etc

