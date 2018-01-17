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
        NSDictionary *json = task.result;
        NSString *token = [NSString cast:[NSDictionary cast:json[@"data"]][@"token"]];
        guard_ret(token, [BFTask taskWithError:FBAPIParser.invalidJSON]);
        return token;
    };
}

+ (NSError *)invalidJSON {
    return [NSError errorWithDomain:kFBAPIErrorDomain
                               code:kFBAPIInvalidJSONCode
                           userInfo:@{}];
}

@end
