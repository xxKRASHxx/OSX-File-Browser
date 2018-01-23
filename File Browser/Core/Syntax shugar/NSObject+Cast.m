//
//  NSObject+NSObject_Cast.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "NSObject+Cast.h"

@implementation NSObject (Cast)

+ (instancetype)cast:(id)object {
    return [object isKindOfClass:self] ? object : nil;
}

@end
