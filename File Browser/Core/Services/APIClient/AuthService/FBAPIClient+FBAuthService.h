//
//  FBAPIClient+FBAuthService.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIClient.h"

@interface FBAPIClient (FBAuthService)

- (BFTask *)authenticateWithUsername:(NSString *)username
                            password:(NSString *)password;

@end
