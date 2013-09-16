//
//  GHTestGroup+JSON.m
//  GHUnitIOS
//
//  Created by Christopher Brew on 12/14/12.
//
//

#import "GHTestGroup+JSON.h"

@implementation GHTestGroup (JSON)

//- (NSString *)JSON {
//    
//    NSMutableString *tests = [NSMutableString stringWithString:@""];
//    for (id child in self.children) {
//        if ([child respondsToSelector:@selector(JSON)]) {
//            [tests appendString:[NSString stringWithFormat:@"%@, ", [child JSON]]];
//        }
//    }
//    if ([tests length] > 0) tests = [NSMutableString stringWithString:[tests substringToIndex:[tests length] - 2]];
//    
//    return [NSMutableString stringWithFormat:@"{ \"testsuite\": \"%@\", \"count\": %d, \"failures\": %d, \"time\": %0.4f%@ }",
//                            self.name, self.stats.testCount, self.stats.failureCount, self.interval,
//                             ([tests length] > 0 ? [NSString stringWithFormat:@", \"tests\": [ %@ ]", tests] : @"")];
//}

- (id)JSON {
    NSMutableDictionary *jsonDict = [NSMutableDictionary dictionary];
    
    [jsonDict setObject:self.name forKey:@"testsuite"];
    [jsonDict setObject:[NSNumber numberWithInt:self.stats.testCount] forKey:@"count"];
    [jsonDict setObject:[NSNumber numberWithInt:self.stats.failureCount] forKey:@"failures"];
    [jsonDict setObject:[NSString stringWithFormat:@"%0.4f", self.interval] forKey:@"time"];
    
    NSMutableArray *tests = [NSMutableArray array];
    for (id child in self.children) {
        if ([child respondsToSelector:@selector(JSON)]) {
            [tests addObject:[child JSON]];
        }
    }
    if ([tests count] > 0) {
        [jsonDict setObject:tests forKey:@"tests"];
    }
    
    return jsonDict;
}

@end
