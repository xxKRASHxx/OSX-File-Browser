//
//  NSImage+JPEGRepresentation.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/22/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "NSImage+JPEGRepresentation.h"

@implementation NSImage (JPEGRepresentation)

- (NSData *)JPEGRepresentation {
    NSData *tiff = [self TIFFRepresentation];
    NSBitmapImageRep *representation = [[NSBitmapImageRep alloc] initWithData:tiff];
    return [representation representationUsingType:NSBitmapImageFileTypeJPEG properties:@{}];
}

@end
