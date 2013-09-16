//
//  GHTestGroup+Reporting.h
//  GHUnitIOS
//
//  Created by Christopher Brew on 12/14/12.
//
//

#import "GHTestGroup.h"
#import "GHTestGroup+JUnitXML.h"
#import "GHTestGroup+JSON.h"

#define CONTENT_TYPE_XML @"application/xml"
#define CONTENT_TYPE_JSON @"application/json"

@interface GHTestGroup (Reporting)

- (BOOL)writeResults:(NSData *)results atPath:(NSString *)path error:(NSError **)error;
- (BOOL)writeResults:(NSData *)results ofType:(NSString *)type atURL:(NSURL *)url error:(NSError **)error;

@end
