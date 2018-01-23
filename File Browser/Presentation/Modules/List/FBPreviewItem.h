//
//  FBPreviewItem.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/23/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class FBFile;

@interface FBPreviewItem : NSCollectionViewItem

- (void)setupWithFile:(FBFile *)file;

@end
