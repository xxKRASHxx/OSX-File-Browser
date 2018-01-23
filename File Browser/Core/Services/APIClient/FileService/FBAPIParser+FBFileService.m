//
//  FBAPIParser+FBFileService.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/18/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIParser+FBFileService.h"
#import "NSError+FBAPIClient.h"
#import "FBFile.h"

@implementation FBAPIParser (FBFileService)

+ (id(^)(BFTask *))parseFiles {
   return ^id(BFTask *task) {
       guard_ret(task.result, task);
       guard_ret([NSArray cast:task.result], NSError.invalidJSON)
       return [[[task.result
                 map:^id(id object) {
                     guard_ret([NSDictionary cast:object], NSNull.new);
                     return object;
                 }]
                 map:^id(NSDictionary *rawObject) {

                     NSString *originalName = [NSString cast:rawObject[@"originalname"]];
                     NSString *fileName = [NSString cast:rawObject[@"filename"]];
                     NSString *MIMEType = [NSString cast:rawObject[@"mimetype"]];
                     NSNumber *size = [NSNumber cast:rawObject[@"size"]];

                     guard_ret(originalName && fileName && MIMEType && size, NSNull.new);

                     return [[FBFile alloc] initWithFileId:fileName
                                                      name:originalName
                                                  mimeType:MIMEType
                                                      size:size];
                 }]
                 flatten];
   };
}

+ (id(^)(BFTask *))parseFile {
    return ^id(BFTask *task) {
        guard_ret(task.result, task);

        NSDictionary *rawObject;
        guard_ret(rawObject = [NSDictionary cast:task.result], NSError.invalidJSON)

        NSString *originalName = [NSString cast:rawObject[@"originalname"]];
        NSString *fileName = [NSString cast:rawObject[@"filename"]];
        NSString *MIMEType = [NSString cast:rawObject[@"mimetype"]];
        NSNumber *size = [NSNumber cast:rawObject[@"size"]];

        guard_ret(originalName && fileName && MIMEType && size, NSError.invalidJSON);

        return [[FBFile alloc] initWithFileId:fileName
                                         name:originalName
                                     mimeType:MIMEType
                                         size:size];
    };
}

@end
