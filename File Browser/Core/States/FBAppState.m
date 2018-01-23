//
//  FBAppState.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAppState.h"
#import "FBAuthorizationState.h"
#import "FBFilesState.h"

@interface FBAppState()

@property (nonatomic, strong, readwrite) id<FBAuthorizationState> authorization;
@property (nonatomic, strong, readwrite) id<FBFilesState> files;
@end

@implementation FBAppState

- (instancetype)initWithAuthorization:(id<FBAuthorizationState>)authorization
                                files:(id<FBFilesState>)files {
    self = [super init];
    if (self) {
        self.authorization = authorization;
        self.files = files;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Auth: %@\nFiles: %@",
            self.authorization,
            self.files];
}

@end
