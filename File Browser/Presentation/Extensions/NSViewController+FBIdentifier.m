//
//  NSViewController+FBIdentifier.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/23/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "NSViewController+FBIdentifier.h"

@implementation NSViewController (FBIdentifier)

+ (NSPageControllerObjectIdentifier)identifier {
    return NSStringFromClass(self);
}

@end
