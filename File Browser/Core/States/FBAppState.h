//
//  FBAppState.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

@protocol FBAuthorizationState;
@protocol FBFilesState;

@interface FBAppState : NSObject <RxState>

@property (nonatomic, readonly) id<FBAuthorizationState> authorization;
@property (nonatomic, readonly) id<FBFilesState> files;

- (instancetype)initWithAuthorization:(id<FBAuthorizationState>)authorization
                                files:(id<FBFilesState>)files;

@end
