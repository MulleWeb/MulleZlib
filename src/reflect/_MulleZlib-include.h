/*
 *   This file will be regenerated by `mulle-sourcetree-to-c` via
 *   `mulle-sde reflect` and any edits will be lost.
 *   Suppress generation of this file with:
 *
 *      mulle-sde environment set MULLE_SOURCETREE_TO_C_INCLUDE_FILE DISABLE
 *
 *   To not let mulle-sourcetree-to-c generate any header files:
 *
 *      mulle-sde environment set MULLE_SOURCETREE_TO_C_RUN DISABLE
 *
 */

#ifndef _mulle_zlib_include_h__
#define _mulle_zlib_include_h__

// You can tweak the following #include with these commands.
// (Use 3da2738b-6ef6-4a45-9bc6-c5168357f7e3 instead of z if there are duplicate entries)
//    remove:             `mulle-sde dependency mark z no-header`
//    rename:             `mulle-sde dependency|library set z include whatever.h`
//    reorder:            `mulle-sde dependency move z <up|down>`
//    toggle #include:    `mulle-sde dependency mark z [no-]import`
//    toggle public:      `mulle-sde dependency mark z [no-]public`
//    toggle optional:    `mulle-sde dependency mark z [no-]require`
//    remove for platform:`mulle-sde dependency mark z no-platform-<uname>`
//        (use `mulle-sourcetree-to-c --unames` to list known values)
# if defined( __APPLE__)
# include <zlib.h>   // z
#endif

// You can tweak the following #include with these commands.
// (Use d88f3c0d-aca6-4387-9123-dc859b291ba2 instead of zlib if there are duplicate entries)
//    remove:             `mulle-sde dependency mark zlib no-header`
//    rename:             `mulle-sde dependency|library set zlib include whatever.h`
//    reorder:            `mulle-sde dependency move zlib <up|down>`
//    toggle #include:    `mulle-sde dependency mark zlib [no-]import`
//    toggle public:      `mulle-sde dependency mark zlib [no-]public`
//    toggle optional:    `mulle-sde dependency mark zlib [no-]require`
//    remove for platform:`mulle-sde dependency mark zlib no-platform-<uname>`
//        (use `mulle-sourcetree-to-c --unames` to list known values)
# if ! defined( __APPLE__)
# include <zlib.h>   // zlib
#endif

#endif
