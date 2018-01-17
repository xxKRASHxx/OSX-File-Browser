//
//  FBAppState.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAuthorizationState.h"

@interface FBAppState : NSObject <RxState>

@property (nonatomic, readonly) id<FBAuthorizationState> authorization;

- (instancetype)initWithAuthorization:(id<FBAuthorizationState>)authorization;

@end
