//
//  NSData+FBMultipart.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/22/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "NSData+FBMultipart.h"

@implementation NSData (FBMultipart)

- (instancetype)byMakingMultipartBodyWithBoundary:(NSString *)boundary
                                             name:(NSString *)name
                                         fileName:(NSString *)filename {
    NSMutableData *body = [NSMutableData data];
    NSMutableString *string = [NSMutableString new];

    [string appendString:[NSString stringWithFormat:@"\r\n--%@\r\n", boundary]];
    [string appendString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\";\r\n", name, filename]];
    [string appendString:@"Content-Type: image/jpeg\r\n\r\n"];

    [body appendData:[string dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:self];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary]
                      dataUsingEncoding:NSUTF8StringEncoding]];
    
    return body.copy;
}

@end
