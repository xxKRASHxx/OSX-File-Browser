//
//  NSError+FBAPIClient.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "NSError+FBAPIClient.h"

NSInteger const kFBAPIInvalidJSONCode = 1002;
NSInteger const kFBAPIResponceNilCode = 1001;
NSString * const kFBAPIErrorDomain = @"FBAPIClient";

@implementation NSError (FBAPIClient)

+ (NSError *)errorFromURLResponce:(NSHTTPURLResponse *)responce {
    guard_ret(responce, [NSError errorWithDomain:kFBAPIErrorDomain
                                            code:kFBAPIResponceNilCode
                                        userInfo:@{NSLocalizedDescriptionKey : @"NSHTTPURLResponse is nil"}]);
    guard_ret((![@[@(200), @(202)] containsObject:@(responce.statusCode)]), nil);
    return [NSError errorWithDomain:kFBAPIErrorDomain
                               code:responce.statusCode
                           userInfo:@{@"responce":responce}];
}

@end
