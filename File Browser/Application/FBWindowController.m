//
//  FBWindowController.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/23/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBWindowController.h"

#import "FBAppState.h"
#import "FBAuthorizationState.h"
#import "FBFilesState.h"
#import "FBLogger.h"
#import "FBPrefetchFilesMiddleware.h"
#import "FBWebImageMiddleware.h"
#import "FBAppReducer.h"

RxStore *MainStore = nil;

@interface FBWindowController ()

@end

@implementation FBWindowController

+ (void)initialize {
    if (self == FBWindowController.class) {
        [self setupStore];
    }
}

+ (void)setupStore {
    FBAppState *appstate = [[FBAppState alloc]
                            initWithAuthorization:FBAuthorizationStateUnauthorized.new
                            files:[[FBFilesState alloc] initWithState:FBLoadingStateNone error:nil files:nil]];
    MainStore = [[RxStore alloc] initWithState:appstate
                                       reducer:FBAppReducer
                                   middlewares:@[FBActionLogger, FBStateLogger,
                                                 FBPrefetchFilesMiddleware, FBWebImageMiddleware]];
}

@end
