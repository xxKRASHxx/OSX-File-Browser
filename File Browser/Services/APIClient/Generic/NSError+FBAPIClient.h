//
//  NSError+FBAPIClient.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSInteger const kFBAPIInvalidJSONCode;
extern NSInteger const kFBAPIResponceNilCode;
extern NSString *const kFBAPIErrorDomain;

@interface NSError (FBAPIClient)

+ (NSError *)errorFromURLResponce:(NSHTTPURLResponse *)responce;

@end
