#import "import.h"


@interface NSData( MulleObjCZlibFoundation)

- (NSData *) zlibCompressedDataWithCompressionLevel:(int) level;
- (NSData *) zlibCompressedData;
- (NSData *) zlibDecompressedData;

@end