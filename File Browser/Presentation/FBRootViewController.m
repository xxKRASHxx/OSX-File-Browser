//
//  FBRootViewController.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/23/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBRootViewController.h"
#import "NSViewController+FBIdentifier.h"

#import "FBAuthViewController.h"
#import "FBListViewController.h"

#import "FBWindowController.h"
#import "FBAppState.h"
#import "FBAuthorizationState.h"

@interface FBRootViewController () <NSPageControllerDelegate, RxSubscriber>

@end

@implementation FBRootViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigation];
    [self setupObserving];
}

- (void)setupNavigation {
    self.delegate = self;
    self.arrangedObjects = @[FBAuthViewController.identifier,
                             FBListViewController.identifier];
}

- (void)setupObserving {
    [MainStore subscribe:self withStateSelector:^id<RxState>(FBAppState *state) {
        return state.authorization;
    }];
}

- (void)dealloc {
    [MainStore unsubscribe:self];
}

- (void)scrollWheel:(NSEvent *)theEvent {}

#pragma mark - <RxSubscriber>

- (void)onStateChanged:(id<FBAuthorizationState>)state {
    dispatch_async(dispatch_get_main_queue(), ^{
        guard_ret(![FBAuthorizationStateAuthorized cast:state], [self processAuthorized:state]);
        [self processUnauthorized:state];
    });
}

- (void)processUnauthorized:(id<FBAuthorizationState>)state {
    self.selectedIndex = 0;
}

- (void)processAuthorized:(id<FBAuthorizationState>)state {
    self.selectedIndex = 1;
}

#pragma mark - <NSPageControllerDelegate>

- (NSViewController *)pageController:(NSPageController *)pageController
         viewControllerForIdentifier:(NSPageControllerObjectIdentifier)identifier {
    return [[NSStoryboard storyboardWithName:@"Main" bundle:nil]
            instantiateControllerWithIdentifier:identifier];
}

- (NSPageControllerObjectIdentifier)pageController:(NSPageController *)pageController
                               identifierForObject:(id)object {
    return object;
}

- (void)pageControllerDidEndLiveTransition:(NSPageController *)pageController {
    [pageController completeTransition];
}

@end
