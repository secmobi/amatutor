(gdb) disass vuln
Dump of assembler code for function vuln:
0x00008454 <vuln+0>:	push	{r11, lr}
0x00008458 <vuln+4>:	add	r11, sp, #4
0x0000845c <vuln+8>:	sub	sp, sp, #24
0x00008460 <vuln+12>:	str	r0, [r11, #-24]
0x00008464 <vuln+16>:	ldr	r3, [r11, #-24]
0x00008468 <vuln+20>:	sub	r2, r11, #16
0x0000846c <vuln+24>:	mov	r0, r2
0x00008470 <vuln+28>:	mov	r1, r3
0x00008474 <vuln+32>:	bl	0x835c <strcpy>
0x00008478 <vuln+36>:	sub	sp, r11, #4
0x0000847c <vuln+40>:	pop	{r11, lr}
0x00008480 <vuln+44>:	bx	lr
End of assembler dump.
