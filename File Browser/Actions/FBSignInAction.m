//
//  FBSignInAction.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBSignInAction.h"

@interface FBSignInAction()

@property (nonatomic, strong, readwrite) NSString *username;
@property (nonatomic, strong, readwrite) NSString *password;

@end

@implementation FBSignInAction

- (instancetype)initWithUsername:(NSString *)username
                        password:(NSString *)password {
    self = [super init];
    if (self) {
        self.username = username;
        self.password = password;
    }
    return self;
}

@end
