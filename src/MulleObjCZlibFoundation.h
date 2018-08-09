#import "import.h"

#include <stdint.h>

/*
 *  (c) 2018 mulle_kybernetik_tv 
 *
 *  version:  major, minor, patch
 */
#define MULLE_OBJC_ZLIB_FOUNDATION_VERSION  ((0 << 20) | (7 << 8) | 56)


static inline unsigned int   Mulle_ObjC_Zlib_Foundation_get_version_major( void)
{
   return( MULLE_OBJC_ZLIB_FOUNDATION_VERSION >> 20);
}


static inline unsigned int   Mulle_ObjC_Zlib_Foundation_get_version_minor( void)
{
   return( (MULLE_OBJC_ZLIB_FOUNDATION_VERSION >> 8) & 0xFFF);
}


static inline unsigned int   Mulle_ObjC_Zlib_Foundation_get_version_patch( void)
{
   return( MULLE_OBJC_ZLIB_FOUNDATION_VERSION & 0xFF);
}


extern uint32_t   Mulle_ObjC_Zlib_Foundation_get_version( void);

/*
   Add other library headers here like so, for exposure to library
   consumers.

   # include "foo.h"
*/
