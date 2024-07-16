/* It can often be useful to know the CPU on which a cloud instance is
 * running (e.g. to isolate problems with Azure AMD instances).
 */
#ifdef IMAGE_FILE_MACHINE_ARM64
#define CPUID_SETTINGS
#endif
