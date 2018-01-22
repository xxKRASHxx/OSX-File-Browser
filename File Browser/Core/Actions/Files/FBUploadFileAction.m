//
//  FBUploadFileAction.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/21/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBUploadFileAction.h"

@interface FBUploadFileAction()

@property (nonatomic, strong, readwrite) NSData *data;

@end

@implementation FBUploadFileAction

- (instancetype)initWithData:(NSData *)data {
    self = [super init];
    if (self) {
        self.data = data;
    }
    return self;
}

@end
