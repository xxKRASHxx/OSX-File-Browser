//
//  FBAPIBuilder+FBAuthService.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIBuilder+FBAuthService.h"

@implementation FBAPIBuilder (FBAuthService)

+ (NSURL *)baseURL {
    return [NSURL URLWithString:kFBAuthServerBaseURL];
}

+ (NSURL *)authURL {
    return [[self.baseURL
             URLByAppendingPathComponent:@"auth"]
             URLByAppendingPathComponent:@"login"];
}

+ (NSURLRequest *)authRequestForUsername:(NSString *)username
                                password:(NSString *)password {
    return [self requestWithURL:self.authURL
                         method:FBAPIClientMethodPost
                     parameters: @{ @"username" : username,
                                    @"password" : password }];
}

@end
