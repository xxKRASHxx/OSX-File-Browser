//
//  FBAPIBuilder.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBAPIClient.h"

@interface FBAPIBuilder : NSObject

+ (NSURL *)baseURL;

+ (NSData *)dataFromDictionary:(NSDictionary *)dictionary;

+ (NSURLRequest *)requestWithURL:(NSURL *)url
                          method:(FBAPIClientMethod)method
                      parameters:(NSDictionary *)parameters;

+ (NSURLRequest *)requestWithURL:(NSURL *)url
                          method:(FBAPIClientMethod)method
                         headers:(NSDictionary<NSString *, NSString*> *)headers
                      parameters:(NSDictionary *)parameters;

+ (NSURLRequest *)requestWithURL:(NSURL *)url
                          method:(FBAPIClientMethod)method
                           token:(NSString *)token
                      parameters:(NSDictionary *)parameters;

+ (NSURLRequest *)requestWithURL:(NSURL *)url
                          method:(FBAPIClientMethod)method
                           token:(NSString *)token
                         headers:(NSDictionary<NSString *, NSString*> *)headers
                            data:(NSData *)body;

+ (NSURLRequest *)requestWithURL:(NSURL *)url
                          method:(NSString *)method
                         headers:(NSDictionary<NSString *, NSString*> *)headers
                            data:(NSData *)body;

@end
