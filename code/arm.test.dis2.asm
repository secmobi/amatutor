(gdb) b vuln
Breakpoint 1 at 0x8454
(gdb) run 1234
Starting program: /home/user/test 1234

Breakpoint 1, 0x00008454 in vuln ()
(gdb) nexti 9
0x00008478 in vuln ()
(gdb) x/8x $sp
0xbedb9788:	0x00000000	0xbedb9a09	0x00000000	0x34333231
0xbedb9798:	0x00000000	0x000084c4	0xbedb97b4	0x000084ac
(gdb) 
