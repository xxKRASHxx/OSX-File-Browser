//
//  FBUploadFileAction.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/21/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBUploadFileAction : NSObject <RxAction>

@property (nonatomic, strong, readonly) NSData *data;

- (instancetype)initWithData:(NSData *)data;

@end
