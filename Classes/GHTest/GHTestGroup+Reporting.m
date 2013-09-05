//
//  GHTestGroup+Reporting.m
//  GHUnitIOS
//
//  Created by Christopher Brew on 12/14/12.
//
//

#import "GHTestGroup+Reporting.h"

@implementation GHTestGroup (Reporting)

- (BOOL)writeResults:(NSString *)results atPath:(NSString *)path error:(NSError **)error {
    if (self.stats.testCount > 0) {
        
        NSString *XMLPath = [path stringByAppendingPathComponent:
                             [NSString stringWithFormat:@"%@.xml", self.name]];

        // Attempt to write the XML and return the success status
        return [results writeToFile:XMLPath atomically:NO encoding:NSUTF8StringEncoding error:error];
    }
    return YES;
}

- (BOOL)writeResults:(NSString *)results ofType:(NSString *)type atURL:(NSURL *)url error:(NSError **)error {
    if (self.stats.testCount > 0) {
        
        NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
        [req setHTTPMethod:@"POST"];
        [req addValue:self.name forHTTPHeaderField:@"X-TEST-NAME"];
        [req addValue:type forHTTPHeaderField:@"Content-Type"];
        [req setHTTPBody:[results dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSLog(@"Writing test results to %@", url);
        
        NSData *response = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:error];
        
        NSLog(@"Server response:");
        NSLog(@"%@", response == nil ? @"nil" : [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]);
        
        return response != nil;
    }
    return YES;
}

@end
