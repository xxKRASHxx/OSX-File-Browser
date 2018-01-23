//
//  FBDropView.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/23/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface FBDropView : NSImageView <NSDraggingDestination>

@property (nonatomic, strong) void (^uploadAtURL)(NSURL *);

@end
