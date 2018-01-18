//
//  FBAPIBuilder+FBFileService.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/18/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIBuilder.h"

@interface FBAPIBuilder (FBFileService)

+ (NSURLRequest *)filesListRequestWithToken:(NSString *)jwt;
+ (NSURLRequest *)downloadFileRequestWithToken:(NSString *)jwt
                                      filename:(NSString *)name;
+ (NSURLRequest *)uploadFileRequestWithToken:(NSString *)jwt
                                        data:(NSData *)data;

@end
