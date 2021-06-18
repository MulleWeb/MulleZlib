# MulleZlib

#### 🐘 Zlib compression for mulle-objc

Compression and decompression of NSData.

Adds the following compression and decompressions methods to **NSData**:

```
- (NSData *) mulleZlibCompressedDataWithCompressionLevel:(int) level;
- (NSData *) mulleZlibCompressedData;
- (NSData *) mulleZlibDecompressedData;
```

#### Example:

Compress and decompress a string:

```
NSData     *data;
NSData     *compressed;
NSData     *decompressed;
NSString   *s;

data         = [@"VfL Bochum 1848" dataUsingEncoding:NSUTF8StringEncoding];
compressed   = [data mulleZlibCompressedData];
decompressed = [compressed mulleZlibDecompressedData];
s            = [NSString mulleStringWithData:decompressed
                                    encoding:NSUTF8StringEncoding];
```

### You are here

```
  .------------------------------------------------.
  | MulleWebClient                                 |
  '------------------------------------------------'
                    .------------..----------------.
                    | JSMN       || HTTP           |
                    '------------''----------------'
  .----------------..------------..----------------.
  | Curl           || Plist      || Inet           |
  '----------------''------------''----------------'
  .=========..-----------------------------.
  | Zlib    || Standard                    |
  '=========''-----------------------------'
  .----------------------------------------..------.
  | Value                                  || Lock |
  '----------------------------------------''------'
```

## Add

Use [mulle-sde](//github.com/mulle-sde) to add MulleZlib to your project:

```
mulle-sde dependency add --objc --github MulleWeb MulleZlib
```

## Install

Use [mulle-sde](//github.com/mulle-sde) to build and install MulleZlib and
all its dependencies:

```
mulle-sde install --objc --prefix /usr/local \
   https://github.com/MulleWeb/MulleZlib/archive/latest.tar.gz
```

## Acknowledgements

MulleZlib links against [zlib](https://www.zlib.net/). zlib was written by
Jean-loup Gailly (compression) and Mark Adler (decompression)


## Author

[Nat!](//www.mulle-kybernetik.com/weblog) for
[Mulle kybernetiK](//www.mulle-kybernetik.com) and
[Codeon GmbH](//www.codeon.de)
