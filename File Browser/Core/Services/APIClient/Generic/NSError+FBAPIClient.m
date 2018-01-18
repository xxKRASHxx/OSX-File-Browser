//
//  NSError+FBAPIClient.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "NSError+FBAPIClient.h"

NSInteger const kFBAPICanceledCode = 1004;
NSInteger const kFBAPIInvalidResponceCode = 1003;
NSInteger const kFBAPIInvalidJSONCode = 1002;
NSInteger const kFBAPIResponceNilCode = 1001;

NSString * const kFBAPIErrorDomain = @"FBAPIClient";

@implementation NSError (FBAPIClient)

+ (NSError *)errorFromURLResponce:(NSURLResponse *)responce {

    guard_ret(responce, [NSError errorWithDomain:kFBAPIErrorDomain
                                            code:kFBAPIResponceNilCode
                                        userInfo:@{NSLocalizedDescriptionKey : @"NSHTTPURLResponse is nil"}]);
    NSHTTPURLResponse *httpResponce;
    guard_ret(httpResponce = [NSHTTPURLResponse cast:responce],
              [NSError errorWithDomain:kFBAPIErrorDomain
                                  code:kFBAPIInvalidResponceCode
                              userInfo:@{NSLocalizedDescriptionKey: @"Wrong responce type"}]);

    guard_ret((![@[@(200), @(202)] containsObject:@(httpResponce.statusCode)]), nil);
    return [NSError errorWithDomain:kFBAPIErrorDomain
                               code:httpResponce.statusCode
                           userInfo:@{@"responce" : responce}];
}

+ (NSError *)errorFromStatus:(NSNumber *)code meta:(NSDictionary *)meta {
    return [NSError errorWithDomain:kFBAPIErrorDomain
                               code:code.integerValue
                           userInfo:@{NSLocalizedDescriptionKey : @"API error",
                                      @"meta" : meta }];
}

+ (NSError *)invalidJSON {
    return [NSError errorWithDomain:kFBAPIErrorDomain
                               code:kFBAPIInvalidJSONCode
                           userInfo:nil];
}

+ (NSError *)canceled {
    return [NSError errorWithDomain:kFBAPIErrorDomain
                               code:kFBAPICanceledCode
                           userInfo:nil];
}

@end
