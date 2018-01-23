//
//  FBAPIBuilder+FBFileService.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/18/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIBuilder+FBFileService.h"
#import "NSData+FBMultipart.h"

@implementation FBAPIBuilder (FBFileService)

+ (NSURL *)filesListURL {
    return [self.baseURL URLByAppendingPathComponent:@"file"];
}

+ (NSURL *)fileURL:(NSString *)file {
    return [[self.baseURL
             URLByAppendingPathComponent:@"file"]
             URLByAppendingPathComponent:file];
}

+ (NSURLRequest *)filesListRequestWithToken:(NSString *)jwt {
    return [self requestWithURL:self.filesListURL
                         method:FBAPIClientMethodGet
                          token:jwt
                     parameters:nil];
}

+ (NSURLRequest *)downloadFileRequestWithToken:(NSString *)jwt
                                      filename:(NSString *)name {
    return [self requestWithURL:self.filesListURL
                         method:FBAPIClientMethodGet
                          token:jwt
                     parameters:nil];
}

+ (NSURLRequest *)uploadFileRequestWithToken:(NSString *)jwt
                                        data:(NSData *)data {
    NSString *boundary = NSUUID.new.UUIDString;
    NSData *body = [data byMakingMultipartBodyWithBoundary:boundary
                                                      name:@"secfile"
                                                  fileName:@"image.jpg"];
    NSDictionary *headers =
    @{
      @"Content-Type" : [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary],
      @"Content-Length" : @(body.length).stringValue
      };
    return [self requestWithURL:self.filesListURL
                         method:FBAPIClientMethodPost
                          token:jwt
                        headers:headers
                           data:body];
}

@end
