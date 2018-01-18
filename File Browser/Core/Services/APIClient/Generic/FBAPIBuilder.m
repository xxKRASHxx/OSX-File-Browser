//
//  FBAPIBuilder.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIBuilder.h"

@implementation FBAPIBuilder

+ (NSURL *)baseURL {
    return [NSURL URLWithString:kFBAuthServerBaseURL];
}

+ (NSData *)dataFromDictionary:(NSDictionary *)dictionary {
    NSURLComponents *components = [NSURLComponents new];
    components.queryItems = [[dictionary map:^id(id key, id value) {
        NSString *parsedKey = [NSString cast:key];
        NSString *parsedValue = [NSString cast:value] ?: [NSNumber cast:value].stringValue;
        guard_ret((parsedKey && parsedValue), nil);
        return [NSURLQueryItem queryItemWithName:parsedKey
                                           value:parsedValue];
    }] flatten];
    return [components.query dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSURLRequest *)requestWithURL:(NSURL *)url
                          method:(FBAPIClientMethod)method
                           token:(NSString *)token
                      parameters:(NSDictionary *)parameters {

    NSMutableDictionary *withToken = @{}.mutableCopy;
    withToken[@"authorization"] = token;
    [withToken addEntriesFromDictionary:parameters];

    return [self requestWithURL:url
                         method:method
                     parameters:withToken.copy];
}

+ (NSURLRequest *)requestWithURL:(NSURL *)url
                          method:(FBAPIClientMethod)method
                      parameters:(NSDictionary *)parameters {
    return [self requestWithURL:url
                         method:NSStringFromRequestMethod(method)
                           data:[self dataFromDictionary:parameters]];
}

+ (NSURLRequest *)requestWithURL:(NSURL *)url
                          method:(NSString *)method
                            data:(NSData *)body {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = method;
    request.HTTPBody = body;
    return request;
}

@end
