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

- (NSString *)JSON {
    
    NSString *failureString = self.exception ? [NSString stringWithFormat:@", \"failure\": { \"message\": \"%@\", \"description\": \"%@\" }", [[self.exception description] urlEncodeUsingEncoding:NSUTF8StringEncoding],
                                                [[GHTesting descriptionForException:self.exception] urlEncodeUsingEncoding:NSUTF8StringEncoding]] : @"";
    
    return [NSString stringWithFormat:@"{ \"name\":\"%@\", \"classname\":\"%@\", \"time\":%0.4f%@ }", self.name, [self.target class], self.interval, failureString];
}

@end
