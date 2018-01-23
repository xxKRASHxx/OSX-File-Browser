//
//  FBUpdateFilesAction.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/21/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBUpdateFilesAction.h"

@interface FBUpdateFilesAction()

@property (nonatomic, strong, readwrite) NSArray<FBFile *> *files;
@property (nonatomic, strong, readwrite) NSError *error;

@end

@implementation FBUpdateFilesAction

- (instancetype)initWithFiles:(NSArray<FBFile *> *)files
                        error:(NSError *)error {
    self = [super init];
    if (self) {
        self.files = files;
        self.error = error;
    }
    return self;
}

@end
