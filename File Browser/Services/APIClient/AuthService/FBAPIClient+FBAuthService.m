//
//  FBAPIClient+FBAuthService.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIClient+FBAuthService.h"
#import "FBAPIBuilder+FBAuthService.h"
#import "FBAPIParser+FBAuthService.h"

@implementation FBAPIClient (FBAuthService)

- (BFTask *)authenticateWithUsername:(NSString *)username
                            password:(NSString *)password {
    return [[[[self performDataTaskWithRequest:
               [FBAPIBuilder authRequestForUsername:username password:password]]
               continueWithBlock:FBAPIParser.parseData]
               continueWithBlock:FBAPIParser.parseDictionary]
               continueWithBlock:FBAPIParser.parseToken];
}

@end
