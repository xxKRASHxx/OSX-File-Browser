//
//  FBFilesMiddleware.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/18/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBPrefetchFilesMiddleware.h"
#import "FBAppState.h"
#import "FBAuthorizationState.h"
#import "AppDelegate.h"
#import "FBFetchFilesAction.h"

RxMiddleware FBPrefetchFilesMiddleware = ImplementMiddleware({
    
    id<FBAuthorizationState> oldState = [FBAppState cast:getState()].authorization;
    next(action);
    id<FBAuthorizationState> state = [FBAppState cast:getState()].authorization;

    BOOL shouldPrefetchFiles =
    [FBAuthorizationStateAuthorized cast:state] && ![FBAuthorizationStateAuthorized cast:oldState];
    guard_ret(shouldPrefetchFiles, action);

    [MainStore dispatch:FBFetchFilesAction.new];

    return action;
})
