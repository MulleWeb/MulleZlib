/*
 *   This file will be regenerated by `mulle-sde reflect` and any edits will be
 *   lost. Suppress generation of this file with:
 *      mulle-sde environment --global \
 *         set MULLE_SOURCETREE_TO_C_INCLUDE_FILE DISABLE
 *
 *   To not generate any header files:
 *      mulle-sde environment --global \
 *         set MULLE_SOURCETREE_TO_C_RUN DISABLE
 */

#ifndef _MulleZlib_include_h__
#define _MulleZlib_include_h__

// How to tweak the following z #include
//    remove:             `mulle-sourcetree mark z no-header`
//    rename:             `mulle-sde dependency|library set z include whatever.h`
//    toggle #import:     `mulle-sourcetree mark z [no-]import`
//    toggle localheader: `mulle-sourcetree mark z [no-]localheader`
//    toggle public:      `mulle-sourcetree mark z [no-]public`
//    toggle optional:    `mulle-sourcetree mark z [no-]require`
//    remove for os:      `mulle-sourcetree mark z no-os-<osname>`
# if defined( __APPLE__)
#  if defined( __has_include) && __has_include("zlib.h")
#     include "zlib.h"   // z
#  else
#     include <zlib.h>   // z
#  endif
# endif

// How to tweak the following zlib #include
//    remove:             `mulle-sourcetree mark zlib no-header`
//    rename:             `mulle-sde dependency|library set zlib include whatever.h`
//    toggle #import:     `mulle-sourcetree mark zlib [no-]import`
//    toggle localheader: `mulle-sourcetree mark zlib [no-]localheader`
//    toggle public:      `mulle-sourcetree mark zlib [no-]public`
//    toggle optional:    `mulle-sourcetree mark zlib [no-]require`
//    remove for os:      `mulle-sourcetree mark zlib no-os-<osname>`
# if ! defined( __APPLE__)
#  if defined( __has_include) && __has_include("zlib.h")
#     include "zlib.h"   // zlib
#  else
#     include <zlib.h>   // zlib
#  endif
# endif

#endif
