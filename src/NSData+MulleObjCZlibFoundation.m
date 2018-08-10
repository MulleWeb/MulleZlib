#import "NSData+MulleObjCZlibFoundation.h"

#import "import-private.h"


@implementation NSData( MulleObjCZlibFoundation)

- (NSData *) zlibCompressedDataWithCompressionLevel:(int) level
{
   NSMutableData   *data;
   NSUInteger      size;
   z_stream        strm;
   int             ret;

   /* allocate deflate state */
   memset( &strm, 0, sizeof( z_stream));

   data = [NSMutableData data];
   size = 0;

   ret = deflateInit( &strm, level);
   if (ret != Z_OK)
   {
      // TODO: push NSError
      (void) deflateEnd( &strm);
      return( nil);
   }

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

- (NSData *) zlibCompressedData;
{
   return( [self zlibCompressedDataWithCompressionLevel:7]);
}

- (NSData *) zlibDecompressedData
{
   NSMutableData   *data;
   NSUInteger      size;
   z_stream        strm;
   int             ret;

   /* allocate inflate state */
   memset( &strm, 0, sizeof( z_stream));

   data = [NSMutableData data];
   size = 0;

   ret = inflateInit2( &strm, 15 + 32);
   if (ret != Z_OK)
   {
      // TODO: push NSError
      (void) inflateEnd( &strm);
      return( nil);
   }

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
      ret = inflate(&strm, Z_BLOCK);    /* no bad return value */
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