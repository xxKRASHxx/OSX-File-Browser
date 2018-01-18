//
//  FBAPIClient.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FBAPIBuilder;
@class FBAPIParser;

typedef NS_ENUM(NSUInteger, FBAPIClientMethod) {
    FBAPIClientMethodPost,
    FBAPIClientMethodHead,
    FBAPIClientMethodDelete,
    FBAPIClientMethodGet
};

extern NSString *NSStringFromRequestMethod(FBAPIClientMethod aMethod);
extern NSString * const kFBAuthServerBaseURL;

@interface FBAPIClient : NSObject

@property (nonatomic, strong) NSString *token;

- (BFTask *)performDataTaskWithRequest:(NSURLRequest *)request;
- (BFTask *)performDataTaskWithURL:(NSURL *)URL;

@end
