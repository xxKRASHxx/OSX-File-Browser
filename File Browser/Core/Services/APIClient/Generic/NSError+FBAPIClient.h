//
//  NSError+FBAPIClient.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSInteger const kFBAPICanceledCode;
extern NSInteger const kFBAPIInvalidResponceCode;
extern NSInteger const kFBAPIInvalidJSONCode;
extern NSInteger const kFBAPIResponceNilCode;
extern NSString *const kFBAPIErrorDomain;

@interface NSError (FBAPIClient)

+ (NSError *)errorFromURLResponce:(NSURLResponse *)responce meta:(NSDictionary *)meta;
+ (NSError *)errorFromURLResponce:(NSURLResponse *)responce;
+ (NSError *)errorFromStatus:(NSNumber *)code meta:(NSDictionary *)meta;
+ (NSError *)invalidJSON;
+ (NSError *)canceled;

@end
