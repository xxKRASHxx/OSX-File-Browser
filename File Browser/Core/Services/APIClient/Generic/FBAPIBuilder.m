//
//  FBAPIBuilder.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIBuilder.h"

static NSString * const kTokenFormat = @"Bearer %@";

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
                      parameters:(NSDictionary *)parameters {
    return [self requestWithURL:url
                         method:method
                        headers:nil
                     parameters:parameters];
}

+ (NSURLRequest *)requestWithURL:(NSURL *)url
                          method:(FBAPIClientMethod)method
                           token:(NSString *)token
                      parameters:(NSDictionary *)parameters {
    return [self requestWithURL:url
                         method:method
                        headers:@{@"authorization" : [NSString stringWithFormat:kTokenFormat, token]}
                     parameters:parameters];
}

+ (NSURLRequest *)requestWithURL:(NSURL *)url
                          method:(FBAPIClientMethod)method
                         headers:(NSDictionary<NSString *, NSString*> *)headers
                      parameters:(NSDictionary *)parameters {
    return [self requestWithURL:url
                         method:NSStringFromRequestMethod(method)
                        headers:headers
                           data:[self dataFromDictionary:parameters]];
}

+ (NSURLRequest *)requestWithURL:(NSURL *)url
                          method:(FBAPIClientMethod)method
                           token:(NSString *)token
                         headers:(NSDictionary<NSString *, NSString*> *)headers
                            data:(NSData *)body {
    NSMutableDictionary *allHeaders = headers ? headers.mutableCopy : @{}.mutableCopy;
    allHeaders[@"authorization"] = [NSString stringWithFormat:kTokenFormat, token];
    return [self requestWithURL:url
                         method:NSStringFromRequestMethod(method)
                        headers:allHeaders.copy
                           data:body];
}
+ (NSURLRequest *)requestWithURL:(NSURL *)url
                          method:(NSString *)method
                         headers:(NSDictionary<NSString *, NSString*> *)headers
                            data:(NSData *)body {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.allHTTPHeaderFields = headers;
    request.HTTPMethod = method;
    request.HTTPBody = body;
    return request;
}

@end
