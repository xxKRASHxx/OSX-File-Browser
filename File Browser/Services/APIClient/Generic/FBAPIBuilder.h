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

+ (NSData *)dataFromDictionary:(NSDictionary *)dictionary;

+ (NSURLRequest *)requestWithURL:(NSURL *)url
                          method:(FBAPIClientMethod)method
                      parameters:(NSDictionary *)parameters;

+ (NSURLRequest *)requestWithURL:(NSURL *)url
                          method:(NSString *)method
                            data:(NSData *)body;

@end
