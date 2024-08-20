# High-Performance Computing iPXE

This iPXE configuration is tuned for booting large quantities of new hardware in
Hewlett-Packard Enterprise' High-Performance Computer and Artificial Intelligence division.

## Embedded Script

The `hpc.ipxe` script is an optional script to embed.

Functions:
- Prints out NIC information
  - PCI Signatures
  - MAC Addresses
  - Current link states
- DHCPs from the iPXE ROM
    - Picks up option-175 if set ([ref][^1])
- Provides a menu:
  - Shows resolved boot server
  - Allows a user to specify a different chain
  - Re-print NIC information
  - Reboot the server
  - Exit to the BIOS menu
  - View iPXE settings
  - Access an iPXE shell
  
#### Booting

The embedded script will try three boot method before giving up.

#### iPXE option-175

If [`option-175`][^1] is provided to iPXE when it DHCPs again (after PXE has DHCPed and loaded the iPXE ROM), the embedded script will look for the script name contained in `option-175` on the bootserver.

If `option-175` is not set, then the embedded script will fallback to searching for a file named `script.ipxe`.

Regardless of whether `option-175`is set, the embedded script looks in the following locations for the target chain script:

> Note: If `crosscert` is detected then the embedded script will use HTTPS, otherwise it will use HTTP.

| Order        | URL                                                     | Example                                                            |
|--------------|---------------------------------------------------------|--------------------------------------------------------------------|
| 1            | `https?://${next-server}/${hostname}/${script-name}`    | `http://10.1.1.1/myserver/boot.php`                                | 
| 2            | `https?://${next-server}/${ipv4:uint32}/${script-name}` | `http://10.1.1.1/0xa10015/boot.php` if the leased IP was 10.1.0.21 |
| 3 (fallback) | `https?://${next-server}/${script-name}`                | `http://10.1.1.1/boot.php`                                         |

[^1]: https://ipxe.org/appnote/premature#pxe_chainloading
