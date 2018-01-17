//
//  FBAPIParser.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIParser.h"
#import "FBAPICliendResult.h"
#import "NSError+FBAPIClient.h"

@implementation FBAPIParser

+ (id(^)(BFTask *))parseData {
    return ^id(BFTask *task) {
        guard_ret(task.result, task);
        FBAPICliendResult *result = [FBAPICliendResult cast:task.result];
        NSError *error;
        guard_ret(!(error = [NSError errorFromURLResponce:result.responce]), [BFTask taskWithError:error]);
        return [FBAPICliendResult cast:task.result].data;
    };
}

+ (id(^)(BFTask *))parseDictionary {
    return ^id(BFTask *task) {
        guard_ret(task.result, task);
        NSError *error;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:task.result
                                                             options:kNilOptions
                                                               error:&error];
        guard_ret(!error, [BFTask taskWithError:error]);
        return json;
    };
}

@end
