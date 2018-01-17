//
//  FBAPICliendResult.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBAPICliendResult : NSObject

@property (nonatomic, strong, readonly) NSData *data;
@property (nonatomic, strong, readonly) NSURLResponse *responce;

- (instancetype)initWithData:(NSData *)data
                    responce:(NSURLResponse *)responce;

+ (instancetype)resultWithData:(NSData *)data
                      responce:(NSURLResponse *)responce;

@end
