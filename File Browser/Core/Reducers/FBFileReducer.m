//
//  FBFileReducer.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/19/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBFileReducer.h"
#import "AppDelegate.h"
#import "FBFilesState.h"

#import "FBFetchFilesAction.h"
#import "FBUpdateFilesAction.h"
#import "FBUploadFileAction.h"

#import "FBAPIClient+FBFileService.h"

FBAPIClient *fileService;

id<FBFilesState> fetchFiles          (FBFetchFilesAction  *action, id<FBFilesState> state);

id<FBFilesState> updateFiles         (FBUpdateFilesAction *action, id<FBFilesState> state);
id<FBFilesState> handleUpdateError   (FBUpdateFilesAction *action, id<FBFilesState> state);
id<FBFilesState> handleUpdateSuccess (FBUpdateFilesAction *action, id<FBFilesState> state);
id<FBFilesState> finishUpdating      (FBUpdateFilesAction *action, id<FBFilesState> state);

id<FBFilesState> uploadFile          (FBUploadFileAction  *action, id<FBFilesState> state);

RxReducer FBFileReducer = ^ id<FBFilesState> (id<RxAction> action, id<FBFilesState> state) {
    guard_ret(![FBFetchFilesAction cast:action],  fetchFiles([FBFetchFilesAction cast:action], state));
    guard_ret(![FBUpdateFilesAction cast:action], updateFiles([FBUpdateFilesAction cast:action], state));
    guard_ret(![FBUploadFileAction cast:action],  uploadFile([FBUploadFileAction cast:action], state));
    return state;
};

__attribute__((constructor)) void setupFileService() {
    fileService = FBAPIClient.shared;
}

id<FBFilesState> fetchFiles (FBFetchFilesAction *action, id<FBFilesState> state) {
    [fileService.filesList continueWithBlock:^id _Nullable(BFTask * _Nonnull list) {
        [MainStore dispatch:[[FBUpdateFilesAction alloc] initWithFiles:list.result error:list.error]];
        return nil;
    }];
    return [[FBFilesState alloc] initWithState:FBLoadingStateLoading
                                         error:nil
                                         files:state.files];
}

id<FBFilesState> updateFiles (FBUpdateFilesAction *action, id<FBFilesState> state) {
    guard_ret(!action.error, handleUpdateError(action, state));
    guard_ret(!action.files, handleUpdateSuccess(action, state));
    return finishUpdating(action, state);
}

id<FBFilesState> handleUpdateError (FBUpdateFilesAction *action, id<FBFilesState> state) {
    return [[FBFilesState alloc] initWithState:FBLoadingStateError
                                         error:action.error
                                         files:state.files];
}

id<FBFilesState> handleUpdateSuccess (FBUpdateFilesAction *action, id<FBFilesState> state) {
    return [[FBFilesState alloc] initWithState:FBLoadingStateLoaded
                                         error:nil
                                         files:action.files];
}

id<FBFilesState> finishUpdating (FBUpdateFilesAction *action, id<FBFilesState> state) {
    return [[FBFilesState alloc] initWithState:FBLoadingStateLoaded
                                         error:state.error
                                         files:state.files];
}

id<FBFilesState> uploadFile (FBUploadFileAction  *action, id<FBFilesState> state) {
    [[fileService uploadFileWithData:action.data] continueWithBlock:^id _Nullable(BFTask * _Nonnull task) {
        NSMutableArray *files = state.files.mutableCopy;
        [files push:task.result];
        [MainStore dispatch:[[FBUpdateFilesAction alloc]
                             initWithFiles:files.copy
                             error:task.error]];
        return nil;
    }];
    return state;
}
