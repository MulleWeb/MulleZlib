#import "NSData+MulleZlib.h"

#import "import-private.h"


@implementation NSData( MulleZlib)

- (NSData *) mulleZlibCompressedDataWithCompressionLevel:(int) level
{
   NSMutableData            *data;
   NSUInteger               size;
   struct mulle_allocator   *allocator;
   z_stream                 strm;
   int                      ret;

   /* allocate deflate state */
   memset( &strm, 0, sizeof( z_stream));

   /*
    * by "chance" zlib allocators are the same as mulle_allocators
    * we use mulle_allocators to catch leaks
    */
   allocator   = MulleObjCInstanceGetAllocator( self);
   strm.zalloc = (alloc_func) mulle_allocator_calloc;
   strm.zfree  = (free_func) mulle_allocator_free;
   strm.opaque = allocator;

   ret = deflateInit( &strm, level);
   if (ret != Z_OK)
   {
      // TODO: push NSError
      (void) deflateEnd( &strm);
      return( nil);
   }

   data = [NSMutableData data];
   size = 0;

   strm.avail_in = [self length];
   strm.next_in  = [self bytes];

   for(;;)
   {
      if( size >= strm.total_out)
      {
         [data increaseLengthBy:strm.total_out < 1024 ? 1024 : strm.total_out];
         size = [data length];
      }
      strm.next_out  = (Bytef *) [data mutableBytes] + strm.total_out;
      strm.avail_out = size - strm.total_out;
      ret = deflate(&strm, Z_FINISH);    /* no bad return value */
      switch( ret)
      {
      case Z_OK :
         break;

      case Z_BUF_ERROR :
         [data increaseLengthBy:strm.total_out < 1024 ? 1024 : strm.total_out];
         size = [data length];
         break;

      case Z_STREAM_END:
         [data setLength:strm.total_out];
         (void) deflateEnd( &strm);
         return( data);

      default:
         (void) deflateEnd( &strm);
         return( nil);
      }
   }
}


- (NSData *) mulleZlibCompressedData;
{
   return( [self mulleZlibCompressedDataWithCompressionLevel:6]);
}


- (NSData *) mulleZlibDecompressedData
{
   NSMutableData            *data;
   NSUInteger               size;
   struct mulle_allocator   *allocator;
   z_stream                 strm;
   int                      ret;

   /* allocate inflate state */
   memset( &strm, 0, sizeof( z_stream));

   /*
    * by "chance" zlib allocators are the same as mulle_allocators
    * we use mulle_allocators to catch leaks
    */
   allocator   = MulleObjCInstanceGetAllocator( self);
   strm.zalloc = (alloc_func) mulle_allocator_calloc;
   strm.zfree  = (free_func) mulle_allocator_free;
   strm.opaque = allocator;

   ret = inflateInit2( &strm, 15 + 32);
   if (ret != Z_OK)
   {
      // TODO: push NSError
      (void) inflateEnd( &strm);
      return( nil);
   }

   data = [NSMutableData data];
   size = 0;

   strm.avail_in = [self length];
   strm.next_in  = [self bytes];

   for(;;)
   {
      if( size >= strm.total_out)
      {
         [data increaseLengthBy:strm.total_out < 1024 ? 1024 : strm.total_out];
         size = [data length];
      }
      strm.next_out  = (Bytef *) [data mutableBytes] + strm.total_out;
      strm.avail_out = size - strm.total_out;
      ret = inflate( &strm, Z_BLOCK);    /* no bad return value */
      switch( ret)
      {
      case Z_OK :
         break;

      case Z_BUF_ERROR :
         [data increaseLengthBy:strm.total_out < 1024 ? 1024 : strm.total_out];
         size = [data length];
         break;

      case Z_STREAM_END:
         [data setLength:strm.total_out];
         (void) inflateEnd( &strm);
         return( data);

      default:
         (void) inflateEnd( &strm);
         return( nil);
      }
   }
}

@end
