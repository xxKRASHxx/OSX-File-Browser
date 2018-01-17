//
//  FBAPIParser.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/17/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBAPIParser : NSObject

+ (id(^)(BFTask *))parseData;
+ (id(^)(BFTask *))parseDictionary;

@end
