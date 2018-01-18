//
//  FBAPIClient+FBFileService.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/18/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAPIClient.h"

@interface FBAPIClient (FBFileService)

- (BFTask *)filesList;
- (BFTask *)downloadFileWithFilename:(NSString *)name;
- (BFTask *)uploadFileWithData:(NSData *)data;

@end
