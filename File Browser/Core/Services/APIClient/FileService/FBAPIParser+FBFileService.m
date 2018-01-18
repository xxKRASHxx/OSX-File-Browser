//
//  FBAPIParser+FBFileService.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/18/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIParser+FBFileService.h"

@implementation FBAPIParser (FBFileService)

+ (id(^)(BFTask *))parseFiles {
   return ^id(BFTask *task) {
       guard_ret(task.result, task);
       return task.result;
   };
}

@end
