#import "import.h"

#include <stdint.h>

/*
 *  (c) 2018 mulle_kybernetik_tv
 *
 *  version:  major, minor, patch
 */
#define MULLE_ZLIB_VERSION  ((0 << 20) | (15 << 8) | 4)


static inline unsigned int   MulleZlib_get_version_major( void)
{
   return( MULLE_ZLIB_VERSION >> 20);
}


static inline unsigned int   MulleZlib_get_version_minor( void)
{
   return( (MULLE_ZLIB_VERSION >> 8) & 0xFFF);
}


static inline unsigned int   MulleZlib_get_version_patch( void)
{
   return( MULLE_ZLIB_VERSION & 0xFF);
}


extern uint32_t   MulleZlib_get_version( void);

/*
   Add other library headers here like so, for exposure to library
   consumers.

   # include "foo.h"
*/
#import "NSData+MulleZlib.h"
