//
//  FBAuthorizationReducer.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAuthorizationReducer.h"
#import "AppDelegate.h"
#import "FBAuthorizationState.h"
#import "FBAPIClient+FBAuthService.h"
#import "FBSignInAction.h"
#import "FBSignoutAction.h"
#import "FBSignInResult.h"

FBAPIClient *authService;

id<FBAuthorizationState> processLogin (FBSignInAction *action, id<FBAuthorizationState> state);
id<FBAuthorizationState> processLogout (FBSignoutAction *action, id<FBAuthorizationState> state);
id<FBAuthorizationState> processError (FBSignInFail *action, id<FBAuthorizationState> state);
id<FBAuthorizationState> processSuccess (FBSignInSuccess *action, id<FBAuthorizationState> state);

RxReducer FBAuthorizationReducer = ^ id<FBAuthorizationState> (id<RxAction> action, id<FBAuthorizationState> state) {
    guard_ret(![FBSignInAction cast:action],  processLogin([FBSignInAction cast:action], state));
    guard_ret(![FBSignoutAction cast:action], processLogout([FBSignoutAction cast:action], state));
    guard_ret(![FBSignInFail cast:action],    processError([FBSignInFail cast:action], state));
    guard_ret(![FBSignInSuccess cast:action], processSuccess([FBSignInSuccess cast:action], state));
    return state;
};

__attribute__((constructor)) void setupAuthService() {
    authService = [FBAPIClient new];
}

id<FBAuthorizationState> processLogin (FBSignInAction *action, id<FBAuthorizationState> state) {
    [[authService authenticateWithUsername:action.username
                                  password:action.password] continueWithBlock:^id _Nullable(BFTask * _Nonnull authorization) {
        if (authorization.isCancelled) {
//            [MainStore dispatch:[[FBSignInFail alloc] initWithError:authorization.error]];
//TODO: canceled error
        } else if (authorization.error) {
            [MainStore dispatch:[[FBSignInFail alloc] initWithError:authorization.error]];
        } else {
            [MainStore dispatch:[[FBSignInSuccess alloc] initWithToken:authorization.result
                                                              username:action.username
                                                              password:action.password]];
        }
        return nil;
    }];
    return FBAuthorizationStateAuthorizing.new;
}

id<FBAuthorizationState> processLogout (FBSignoutAction *action, id<FBAuthorizationState> state) {
    return FBAuthorizationStateUnauthorized.new;
}

id<FBAuthorizationState> processError (FBSignInFail *action, id<FBAuthorizationState> state) {
    return [[FBAuthorizationStateError alloc] initWithError:action.error];
}

id<FBAuthorizationState> processSuccess (FBSignInSuccess *action, id<FBAuthorizationState> state) {
    return [[FBAuthorizationStateAuthorized alloc] initWithToken:action.token
                                                        username:action.username
                                                        password:action.password
                                                           email:nil];
}
