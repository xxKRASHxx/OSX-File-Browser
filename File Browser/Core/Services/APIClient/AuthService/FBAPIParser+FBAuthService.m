//
//  FBAPIParser+FBAuthParser.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIParser+FBAuthService.h"
#import "NSError+FBAPIClient.h"

@implementation FBAPIParser (FBAuthService)

+ (id(^)(BFTask *))parseToken {
    return ^id(BFTask *task) {
        guard_ret(task.result, task);
        NSDictionary *data = task.result;
        NSString *token = [NSString cast:data[@"token"]];
        guard_ret(token, [BFTask taskWithError:NSError.invalidJSON]);
        return token;
    };
}



@end
