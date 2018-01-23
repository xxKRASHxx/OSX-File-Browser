//
//  FBWebImageMiddleware.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/23/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBWebImageMiddleware.h"
#import "FBAppState.h"
#import "FBAuthorizationState.h"
#import "FBWindowController.h"

#import <SDWebImage/SDWebImage-umbrella.h>

RxMiddleware FBWebImageMiddleware = ImplementMiddleware({
    id<FBAuthorizationState> authorization = [FBAppState cast:getState()].authorization;

    [[SDWebImageDownloader sharedDownloader]
     setValue:[FBAuthorizationStateAuthorized cast:authorization].token
     forHTTPHeaderField:@"Authorization"];

    return next(action);
})
