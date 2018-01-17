//
//  FBAPIBuilder+FBAuthService.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIBuilder.h"

@interface FBAPIBuilder (FBAuthService)

+ (NSURLRequest *)authRequestForUsername:(NSString *)username
                                password:(NSString *)password;

@end
