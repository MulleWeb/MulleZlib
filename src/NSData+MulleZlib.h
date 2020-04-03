#import "import.h"


@interface NSData( MulleZlib)

- (NSData *) mulleZlibCompressedDataWithCompressionLevel:(int) level;
- (NSData *) mulleZlibCompressedData;
- (NSData *) mulleZlibDecompressedData;

@end
