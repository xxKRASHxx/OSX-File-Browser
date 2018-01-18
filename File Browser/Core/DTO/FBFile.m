//
//  FBFile.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/18/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBFile.h"

@interface FBFile()

@property (nonatomic, strong, readwrite) NSString *fileId;
@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSString *mimeType;
@property (nonatomic, strong, readwrite) NSNumber *size;

@end

@implementation FBFile

- (instancetype)initWithFileId:(NSString *)fileId
                          name:(NSString *)name
                      mimeType:(NSString *)type
                          size:(NSNumber *)size {
    self = [super init];
    if (self) {
        self.fileId = fileId;
        self.name = name;
        self.mimeType = type;
        self.size = size;
    }
    return self;
}

@end
