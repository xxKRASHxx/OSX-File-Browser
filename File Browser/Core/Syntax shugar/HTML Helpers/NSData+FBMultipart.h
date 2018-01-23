//
//  NSData+FBMultipart.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/22/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (FBMultipart)

- (instancetype)byMakingMultipartBodyWithBoundary:(NSString *)boundary
                                             name:(NSString *)name
                                         fileName:(NSString *)filename;

@end
