//
//  FBUpdateFilesAction.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/21/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FBFile;

@interface FBUpdateFilesAction : NSObject <RxAction>

@property (nonatomic, strong, readonly) NSArray<FBFile *> *files;
@property (nonatomic, strong, readonly) NSError *error;

- (instancetype)initWithFiles:(NSArray<FBFile *> *)files
                        error:(NSError *)error;

@end
