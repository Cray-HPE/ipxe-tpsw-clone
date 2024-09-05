/* Enable CERT command: https://ipxe.org/buildcfg/cert_cmd */
#define CERT_CMD

/* Enable VLAN command: https://ipxe.org/buildcfg/vlan_cmd */
#define VLAN_CMD

/* Enable NTP command: https://ipxe.org/buildcfg/ntp_cmd */
#define NTP_CMD

/* Enable TIME command: https://ipxe.org/buildcfg/time_cmd */
#define TIME_CMD

/* Enable PCI_CMD command: https://ipxe.org/buildcfg/pci_cmd */
#define PCI_CMD

/* Enable REBOOT_CMD command: https://ipxe.org/buildcfg/REBOOT_CMD */
#define REBOOT_CMD

/* Enable NEIGHBOUR command: https://ipxe.org/buildcfg/neighbour_cmd */
#define NEIGHBOUR_CMD

/* Enable CONSOLE command: https://ipxe.org/buildcfg/console_cmd */
#define CONSOLE_CMD

/* Enable IMAGE_TRUST_CMD command: https://ipxe.org/buildcfg/image_trust_cmd
usage: Used for enabling the validation of trusted images.
*/
#define IMAGE_TRUST_CMD

/* Enable NSLOOKUP_CMD command: https://ipxe.org/buildcfg/nslookup_cmd
usage: Used for triaging DNS.
*/
#define NSLOOKUP_CMD

/* Enable PING_CMD command: https://ipxe.org/buildcfg/ping_cmd
usage: Used for triaging TCP/IP routing and general connectivity.
*/
#define PING_CMD

/* Enable GDB debugger */
#define GDBUDP

/* DHCP config */
#ifdef DHCP_DISC_START_TIMEOUT_SEC
#undef DHCP_DISC_START_TIMEOUT_SEC
#endif
#define DHCP_DISC_START_TIMEOUT_SEC	    4
#ifdef DHCP_DISC_END_TIMEOUT_SEC
#undef DHCP_DISC_END_TIMEOUT_SEC
#endif
#define DHCP_DISC_END_TIMEOUT_SEC	    32
#ifdef DHCP_DISC_MAX_DEFERRALS
#undef DHCP_DISC_MAX_DEFERRALS
#endif
#define DHCP_DISC_MAX_DEFERRALS		    180

/* Enable Secure Hypertext Transfer Protocol */
#define	DOWNLOAD_PROTO_HTTPS

/* No LACP */
#ifdef NET_PROTO_LACP
#undef NET_PROTO_LACP
#endif

/* Work around missing EFI_PXE_BASE_CODE_PROTOCOL */
#ifndef EFI_DOWNGRADE_UX
#define EFI_DOWNGRADE_UX
#endif

/* The Tivoli VMM workaround causes a KVM emulation failure on hosts
 * without unrestricted_guest support
 */
#ifdef TIVOLI_VMM_WORKAROUND
#undef TIVOLI_VMM_WORKAROUND
#endif
