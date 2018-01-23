//
//  FBFilesState.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/18/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBFilesState.h"

@interface FBFilesState()

@property (nonatomic, assign, readwrite) FBLoadingState state;

@property (nonatomic, strong, readwrite) NSError *error;
@property (nonatomic, strong, readwrite) NSArray<FBFile *> *files;

@end

@implementation FBFilesState

- (instancetype)initWithState:(FBLoadingState)state
                        error:(NSError *)error
                        files:(NSArray<FBFile *> *)files {
    self = [super init];
    if (self) {
        self.state = state;
        self.error = error;
        self.files = files;
    }
    return self;
}

@end
