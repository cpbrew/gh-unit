//
//  GHTest+JSON.m
//  GHUnitIOS
//
//  Created by Christopher Brew on 12/14/12.
//
//

#import "GHTest+JSON.h"
#import "GHTesting.h"
#import "NSString+URLEncoding.h"

@implementation GHTest (JSON)

//- (NSString *)JSON {
//    NSString *failureString = self.exception ? [NSString stringWithFormat:@", \"failure\": { \"message\": \"%@\", \"description\": \"%@\" }", [self.exception description], [GHTesting descriptionForException:self.exception]] : @"";
//    //[[self.exception description] urlEncodeUsingEncoding:NSUTF8StringEncoding], [[GHTesting descriptionForException:self.exception] urlEncodeUsingEncoding:NSUTF8StringEncoding]] : @"";
//    
//    return [NSString stringWithFormat:@"{ \"name\":\"%@\", \"classname\":\"%@\", \"time\":%0.4f%@ }", self.name, [self.target class], self.interval, failureString];
//}

- (id)JSON {
    NSMutableDictionary *jsonDict = [NSMutableDictionary dictionary];
    
    [jsonDict setObject:self.name forKey:@"name"];
    [jsonDict setObject:[NSString stringWithFormat:@"%@", [self.target class]] forKey:@"classname"];
    [jsonDict setObject:[NSString stringWithFormat:@"%0.4f", self.interval] forKey:@"time"];
    
    if (self.exception != nil) {
        NSMutableDictionary *failure = [NSMutableDictionary dictionary];
        [failure setObject:[self.exception description] forKey:@"message"];
        [failure setObject:[GHTesting descriptionForException:self.exception] forKey:@"description"];
        [jsonDict setObject:failure forKey:@"failure"];
    }
    
    return jsonDict;
}

@end
