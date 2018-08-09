#import <MulleObjCZlibFoundation/MulleObjCZlibFoundation.h>


void  check( int no, char *s, size_t len)
{
	NSData   *data;
	NSData   *compressed;
	NSData   *decompressed;

	data = [NSData dataWithBytes:s
				        	 	 length:len];
	compressed = [data zlibCompressedData];
	if( ! compressed && len)
		printf( "#%d: COMPRESSION FAIL\n", no);
	decompressed = [compressed zlibDecompressedData];
	if( ! decompressed && len)
		printf( "#%d:DECOMPRESSION FAIL\n", no);
	if( ! [data isEqualToData:decompressed])
		printf( "#%d:CORRUPTION FAIL: %s\n", no, [decompressed bytes]);
}


int  main( void)
{
	int   i;

	static char emptytext[ 0];
	static char onetwothreetext[] = "0123456789";
	static char longtext[] = "Following World War II, the football section "
"resumed play as the independent VfL Bochum 1848 and played its first season "
"in the second division 2. Oberliga West in 1949, while Preußen Bochum went "
"on to lower tier amateur level play. VfL captured the division title in 1953 "
"to advance to the Oberliga West for a single season. They repeated their"
"divisional win in 1956 and returned to the top-flight until again being "
"relegated after the 1960–61 season."
""
"With the formation of the Bundesliga, Germany's new professional league, in "
"1963 VfL found itself in the third tier Amateurliga Westfalen. A first-place "
"result there in 1965 raised them to the Regionalliga West (II), from which they "
"began a steady climb up the league table to the Bundesliga in 1971. During this " 
"rise, Bochum also played its way to the final of the 1967–68 DFB-Pokal, where" 
"they lost 1–4 to 1. FC Köln."
""
"In spite of being a perennial lower table side, Bochum developed a reputation" 
"for tenaciousness on the field in a run of 20 seasons in the top flight. The "
"club made a repeat appearance in the DFB-Pokal final in 1988, losing 0–1 to "
"Eintracht Frankfurt. Relegated after a 16th-place finish in the 1992–93 season, "  
"the team has become a classic \"yo-yo club\", bouncing up and down between the " 
"Bundesliga and 2. Bundesliga. The club's best Bundesliga results have come "
"relatively recently as fifth-place finishes in 1996–97 and 2003–04, which "
"earned them appearances in the UEFA Cup. In 1997, they advanced to the third "
"round, where they were eliminated by Ajax, and in 2004, they were eliminated "
"early through away goals (0–0 and 1–1) by Standard Liege.";


	check( 0, longtext, sizeof( longtext));
	check( 1, emptytext, sizeof( emptytext));
	for( i = 0; i < 9; i++)
		check( i + 2, &onetwothreetext[ i], sizeof( onetwothreetext) - i);
	return( 0);
}