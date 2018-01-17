//
//  FBSignInResult.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/18/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FBSignInResult <RxAction> @end

@interface FBSignInSuccess: NSObject <FBSignInResult>

@property (nonatomic, readonly) NSString *token;
@property (nonatomic, readonly) NSString *username;
@property (nonatomic, readonly) NSString *password;

- (instancetype)initWithToken:(NSString *)token
                     username:(NSString *)username
                     password:(NSString *)password;

@end

@interface FBSignInFail: NSObject <FBSignInResult>

@property (nonatomic, readonly) NSError *error;

- (instancetype)initWithError:(NSError *)error;

@end
