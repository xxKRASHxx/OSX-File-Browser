//
//  FBAuthorizationState.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAuthorizationState.h"

@implementation FBAuthorizationStateUnauthorized @end

@implementation FBAuthorizationStateAuthorizing @end

@interface FBAuthorizationStateError()

@property (nonatomic, strong, readwrite) NSError *error;

@end

@implementation FBAuthorizationStateError

- (instancetype)initWithError:(NSError *)error {
    self = [super init];
    if (self) {
        self.error = error;
    }
    return self;
}

@end

@interface FBAuthorizationStateAuthorized()

@property (nonatomic, strong, readwrite) NSString *token;
@property (nonatomic, strong, readwrite) NSString *username;
@property (nonatomic, strong, readwrite) NSString *password;
@property (nonatomic, strong, readwrite) NSString *email;

@end

@implementation FBAuthorizationStateAuthorized

- (instancetype)initWithToken:(NSString *)token
                     username:(NSString *)username
                     password:(NSString *)password
                        email:(NSString *)email {
    self = [super init];
    if (self) {
        self.token = token;
        self.username = username;
        self.password = password;
        self.email = email;
    }
    return self;
}

@end
