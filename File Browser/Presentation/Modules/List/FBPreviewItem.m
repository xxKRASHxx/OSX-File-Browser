//
//  FBPreviewItem.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/23/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBPreviewItem.h"
#import "FBFile+FBURL.h"
#import <SDWebImage/SDWebImage-umbrella.h>

@interface FBPreviewItem ()

@property (weak) IBOutlet NSTextFieldCell *titleLabel;
@property (weak) IBOutlet NSImageView *imageView;

@end

@implementation FBPreviewItem

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.imageView sd_cancelCurrentImageLoad];
}

- (void)setupWithFile:(FBFile *)file {
    self.titleLabel.title = file.name;
    [self.imageView sd_setImageWithURL:file.placeholder];
}


@end
