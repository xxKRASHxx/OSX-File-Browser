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
        NSDictionary *json = [NSDictionary cast:task.result];

        id anyData = json[@"data"];
        NSNumber *status      = [NSNumber cast:json[@"status"]];
        NSDictionary *anyMeta = [NSDictionary cast:json[@"meta"]];

        guard_ret(anyData, [NSError errorFromStatus:status meta:anyMeta]);
        return anyData;
    };
}

+ (id(^)(BFTask *))parseResponce {
    return ^id(BFTask *task) {
        guard_ret(task.result, task);
        FBAPICliendResult *result = [FBAPICliendResult cast:task.result];
        NSError *error;

        guard_ret(!(error = [NSError
                             errorFromURLResponce:result.responce
                             meta:self.parseDictionary([BFTask taskWithResult:result.data])]),
                  [BFTask taskWithError:error]);

        return result.data;
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
