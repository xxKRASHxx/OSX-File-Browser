//
//  FBSignInResult.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/18/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBSignInResult.h"

@interface FBSignInSuccess()

@property (nonatomic, strong, readwrite) NSString *token;
@property (nonatomic, strong, readwrite) NSString *username;
@property (nonatomic, strong, readwrite) NSString *password;

@end

@implementation FBSignInSuccess

- (instancetype)initWithToken:(NSString *)token
                     username:(NSString *)username
                     password:(NSString *)password {
    self = [super init];
    if (self) {
        self.token = token;
        self.username = username;
        self.password = password;
    }
    return self;
}

@end

@interface FBSignInFail()

@property (nonatomic, strong, readwrite) NSError *error;

@end

@implementation FBSignInFail

- (instancetype)initWithError:(NSError *)error {
    self = [super init];
    if (self) {
        self.error = error;
    }
    return self;
}

@end
