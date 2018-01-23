//
//  NSCollectionViewItem+FBIdentifier.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/23/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSCollectionViewItem (FBIdentifier)

+ (NSNib *)nib;
+ (NSUserInterfaceItemIdentifier)identifier;

@end
