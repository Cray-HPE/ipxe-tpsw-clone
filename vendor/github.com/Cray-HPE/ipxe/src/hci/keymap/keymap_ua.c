/** @file
 *
 * "ua" keyboard mapping
 *
 * This file is automatically generated; do not edit
 *
 */

FILE_LICENCE ( PUBLIC_DOMAIN );

#include <ipxe/keymap.h>

/** "ua" basic remapping */
static struct keymap_key ua_basic[] = {
	{ 0xdc, 0x3c },	/* Pseudo-'\\' => '<' */
	{ 0xfc, 0x3e },	/* Pseudo-'|' => '>' */
	{ 0, 0 }
};

/** "ua" AltGr remapping */
static struct keymap_key ua_altgr[] = {
	{ 0, 0 }
};

/** "ua" keyboard map */
struct keymap ua_keymap __keymap = {
	.name = "ua",
	.basic = ua_basic,
	.altgr = ua_altgr,
};