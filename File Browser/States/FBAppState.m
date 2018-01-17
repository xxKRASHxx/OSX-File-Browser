//
//  FBAppState.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAppState.h"

@interface FBAppState()

@property (nonatomic, strong, readwrite) id<FBAuthorizationState> authorization;

@end

@implementation FBAppState

- (instancetype)initWithAuthorization:(id<FBAuthorizationState>)authorization {
    self = [super init];
    if (self) {
        self.authorization = authorization;
    }
    return self;
}

- (NSString *)description {
    return self.authorization.description;
}

@end
