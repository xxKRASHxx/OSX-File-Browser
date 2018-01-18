//
//  FBAPIParser+FBFileService.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/18/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIParser.h"

@interface FBAPIParser (FBFileService)

+ (id(^)(BFTask *))parseFiles;

@end
