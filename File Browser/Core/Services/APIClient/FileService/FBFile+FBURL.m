//
//  FBFile+FBURL.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/23/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBFile+FBURL.h"
#import "FBAPIBuilder+FBFileService.h"
@implementation FBFile (FBURL)

- (NSURL *)placeholder {
    return [FBAPIBuilder fileURL:self.fileId];
}

@end
