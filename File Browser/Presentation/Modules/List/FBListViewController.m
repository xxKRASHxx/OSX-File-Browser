//
//  FBListViewController.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/23/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBListViewController.h"
#import "FBWindowController.h"
#import "FBAppState.h"
#import "FBFilesState.h"
#import "FBFile.h"
#import "NSCollectionViewItem+FBIdentifier.h"
#import "FBPreviewItem.h"
#import "FBDropView.h"
#import "FBUploadFileAction.h"

@interface FBListViewController () <RxSubscriber, NSCollectionViewDelegate, NSCollectionViewDataSource>

@property (weak) IBOutlet NSCollectionView *collectionView;
@property (nonatomic, strong) NSArray<FBFile *> *files;
@property (weak) IBOutlet FBDropView *dropView;

@end

@implementation FBListViewController

#pragma mark - Lifecycle



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupObserving];
    [self setupCollectionView];
    [self setupDropView];
}

- (void)setupObserving {
    [MainStore subscribe:self withStateSelector:^id<FBFilesState>(FBAppState *state) {
        return state.files;
    }];
}

- (void)setupCollectionView {
    [self.collectionView registerNib:FBPreviewItem.nib
               forItemWithIdentifier:FBPreviewItem.identifier];
}

- (void)setupDropView {
    self.dropView.uploadAtURL = ^(NSURL *url) {
        [MainStore dispatch:[[FBUploadFileAction alloc] initWithData:[NSData dataWithContentsOfURL:url]]];
    };
}

- (void)dealloc {
    [MainStore unsubscribe:self];
}

#pragma mark - <RxSubscriber>

- (void)onStateChanged:(id<FBFilesState>)file {
    guard(FBLoadingStateLoaded == file.state);
    self.files = file.files;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
}

#pragma mark - <NSCollectionViewDataSource>

- (nonnull NSCollectionViewItem *)collectionView:(nonnull NSCollectionView *)collectionView
             itemForRepresentedObjectAtIndexPath:(nonnull NSIndexPath *)indexPath {
    FBPreviewItem *item = [collectionView makeItemWithIdentifier:FBPreviewItem.identifier
                                                    forIndexPath:indexPath];
    [item setupWithFile:self.files[indexPath.item]];
    return item;
}

- (NSInteger)collectionView:(nonnull NSCollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.files.count;
}

@end

