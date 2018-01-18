//
//  FBSignInAction.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBSignInAction : NSObject <RxAction>

@property (nonatomic, readonly) NSString *username;
@property (nonatomic, readonly) NSString *password;

- (instancetype)initWithUsername:(NSString *)username
                        password:(NSString *)password;

@end
