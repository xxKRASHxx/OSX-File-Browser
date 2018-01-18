//
//  FBAPIClient.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIClient.h"
#import "FBAPIBuilder.h"
#import "FBAPIParser.h"
#import "FBAPICliendResult.h"
#import "NSError+FBAPIClient.h"

extern NSString *NSStringFromRequestMethod(FBAPIClientMethod aMethod) {
    switch (aMethod) {
        case FBAPIClientMethodGet:
            return @"GET";
        case FBAPIClientMethodHead:
            return @"HEAD";
        case FBAPIClientMethodPost:
            return @"POST";
        case FBAPIClientMethodDelete:
            return @"DELETE";
    }
}

NSString * const kFBAuthServerBaseURL = @"http://198.211.123.33:9998";

@implementation FBAPIClient

- (BFTask *)performDataTaskWithRequest:(NSURLRequest *)request {
    BFTaskCompletionSource *completion = [BFTaskCompletionSource taskCompletionSource];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                     completionHandler:^(NSData * _Nullable data,
                                                         NSURLResponse * _Nullable response,
                                                         NSError * _Nullable error)
      {
          guard_ret(error == nil, [completion setError:error]);
          [completion setResult:[FBAPICliendResult resultWithData:data responce:response]];
      }] resume];
    return completion.task;
}

- (BFTask *)performDataTaskWithURL:(NSURL *)URL {
    return [self performDataTaskWithRequest:[NSURLRequest requestWithURL:URL]];
}

@end


