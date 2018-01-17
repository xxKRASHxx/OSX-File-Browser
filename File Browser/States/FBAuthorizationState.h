//
//  FBAuthorizationState.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FBAuthorizationState <RxState> @end

@interface FBAuthorizationStateUnauthorized : NSObject <FBAuthorizationState>
@end

@interface FBAuthorizationStateAuthorizing : NSObject <FBAuthorizationState>
@end

@interface FBAuthorizationStateError : NSObject <FBAuthorizationState>

@property (nonatomic, strong, readonly) NSError *error;

- (instancetype)initWithError:(NSError *)error;

@end

@interface FBAuthorizationStateAuthorized : NSObject <FBAuthorizationState>

@property (nonatomic, strong, readonly) NSString *token;
@property (nonatomic, strong, readonly) NSString *username;
@property (nonatomic, strong, readonly) NSString *password;
@property (nonatomic, strong, readonly) NSString *email;

- (instancetype)initWithToken:(NSString *)token
                     username:(NSString *)username
                     password:(NSString *)password
                        email:(NSString *)email;

@end


