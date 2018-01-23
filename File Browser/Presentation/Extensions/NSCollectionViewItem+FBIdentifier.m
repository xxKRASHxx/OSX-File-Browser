//
//  NSCollectionViewItem+FBIdentifier.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/23/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "NSCollectionViewItem+FBIdentifier.h"

@implementation NSCollectionViewItem (FBIdentifier)

+ (NSNib *)nib {
    return [[NSNib alloc] initWithNibNamed:self.identifier
                                    bundle:nil];
}

+ (NSUserInterfaceItemIdentifier)identifier {
    return NSStringFromClass(self);
}

@end
