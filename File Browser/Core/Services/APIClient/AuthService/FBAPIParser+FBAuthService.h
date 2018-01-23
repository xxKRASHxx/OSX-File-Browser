//
//  FBAPIParser+FBAuthParser.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIParser.h"

@interface FBAPIParser (FBAuthService)

+ (id(^)(BFTask *))parseToken;

@end
