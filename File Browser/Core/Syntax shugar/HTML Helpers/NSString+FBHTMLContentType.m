//
//  NSString+FBHTMLContentType.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/23/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "NSString+FBHTMLContentType.h"

@implementation NSString (FBHTMLContentType)

- (NSString *)contentType {
    NSString *extension = [self componentsSeparatedByString:@"."].lastObject;
    if ([extension isEqualToString:@"jpeg"] || [extension isEqualToString:@"jpg"]) {
        return @"image/jpeg";
    }
    return @"text/plain";
}

@end
