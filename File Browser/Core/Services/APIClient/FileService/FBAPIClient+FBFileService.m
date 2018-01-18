//
//  FBAPIClient+FBFileService.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/18/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIClient+FBFileService.h"
#import "FBAPIBuilder+FBFileService.h"
#import "FBAPIParser+FBFileService.h"

@implementation FBAPIClient (FBFileService)

- (BFTask *)filesList {
    return [[[[[self performDataTaskWithRequest:[FBAPIBuilder filesListRequestWithToken:self.token]]
               continueWithBlock:FBAPIParser.parseResponce]
               continueWithBlock:FBAPIParser.parseDictionary]
               continueWithBlock:FBAPIParser.parseData]
               continueWithBlock:FBAPIParser.parseFiles];
}
//
//- (BFTask *)downloadFileWithFilename:(NSString *)name {
//    return [[[[[self performDataTaskWithRequest:
//                [FBAPIBuilder authRequestForUsername:username password:password]]
//               continueWithBlock:FBAPIParser.parseResponce]
//              continueWithBlock:FBAPIParser.parseDictionary]
//             continueWithBlock:FBAPIParser.parseData]
//}
//
//- (BFTask *)uploadFileWithData:(NSData *)data {
//    return [[[[[self performDataTaskWithRequest:
//                [FBAPIBuilder authRequestForUsername:username password:password]]
//               continueWithBlock:FBAPIParser.parseResponce]
//              continueWithBlock:FBAPIParser.parseDictionary]
//             continueWithBlock:FBAPIParser.parseData]
//}

@end
