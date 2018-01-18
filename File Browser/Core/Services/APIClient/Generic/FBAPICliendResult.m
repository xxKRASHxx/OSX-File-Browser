//
//  FBAPICliendResult.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPICliendResult.h"

@interface FBAPICliendResult()

@property (nonatomic, strong, readwrite) NSData *data;
@property (nonatomic, strong, readwrite) NSURLResponse *responce;

@end

@implementation FBAPICliendResult

- (instancetype)initWithData:(NSData *)data
                    responce:(NSURLResponse *)responce {
    self = [super init];
    if (self) {
        self.data = data;
        self.responce = responce;
    }
    return self;
}

+ (instancetype)resultWithData:(NSData *)data
                      responce:(NSURLResponse *)responce {
    return [[self alloc] initWithData:data
                             responce:responce];
}

@end
