//
//  AppDelegate.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "AppDelegate.h"

#import "FBAppState.h"
#import "FBAuthorizationState.h"
#import "FBFilesState.h"
#import "FBLogger.h"
#import "FBPrefetchFilesMiddleware.h"
#import "FBAppReducer.h"
#import "FBSignInAction.h"

RxStore *MainStore = nil;

@interface AppDelegate ()

//@property (nonatomic, strong, readwrite) RxStore *store;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self setupStore];
}

- (void)setupStore {
    FBAppState *appstate = [[FBAppState alloc]
                            initWithAuthorization:FBAuthorizationStateUnauthorized.new
                            files:[[FBFilesState alloc] initWithState:FBLoadingStateNone error:nil files:nil]];
    MainStore = [[RxStore alloc] initWithState:appstate
                                        reducer:FBAppReducer
                                    middlewares:@[FBActionLogger, FBStateLogger, FBPrefetchFilesMiddleware]];
    [MainStore dispatch:[[FBSignInAction alloc] initWithUsername:@"test" password:@"ohiCanRun1"]];
}

@end
