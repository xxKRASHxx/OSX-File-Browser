//
//  FBFile.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/18/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBFile : NSObject

@property (nonatomic, readonly) NSString *fileId;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *mimeType;
@property (nonatomic, readonly) NSNumber *size;

- (instancetype)initWithFileId:(NSString *)fileId
                          name:(NSString *)name
                      mimeType:(NSString *)type
                          size:(NSNumber *)size;

@end
