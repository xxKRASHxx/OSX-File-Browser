//
//  FBFilesState.h
//  File Browser
//
//  Created by Danil Lisovoy on 1/18/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FBFile;

typedef NS_ENUM(NSUInteger, FBLoadingState) {
    FBLoadingStateNone,
    FBLoadingStateLoading,
    FBLoadingStateLoaded,
    FBLoadingStateError
};

@protocol FBFilesState <RxState>

@property (nonatomic, assign, readonly) FBLoadingState state;

@property (nonatomic, strong, readonly) NSError *error;
@property (nonatomic, strong, readonly) NSArray<FBFile *> *files;

@end

@interface FBFilesState : NSObject <FBFilesState>

- (instancetype)initWithState:(FBLoadingState)state
                        error:(NSError *)error
                        files:(NSArray<FBFile *> *)files;

@end
