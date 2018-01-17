//
//  FBAppReducer.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAppReducer.h"
#import "FBAppState.h"
#import "FBAuthorizationReducer.h"

RxReducer FBAppReducer = ^ id<RxState> (id<RxAction> action, id<RxState> state) {
    return [[FBAppState alloc]
            initWithAuthorization:FBAuthorizationReducer(action, [FBAppState cast:state].authorization)];
};
