//
//  FBFileReducer.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/19/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBFileReducer.h"

RxReducer FBFileReducer = ^ id<FBAuthorizationState> (id<RxAction> action, id<FBAuthorizationState> state) {
    return state;
}
