//
//  FBViewController.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/19/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAuthViewController.h"

#import "FBWindowController.h"
#import "FBAppState.h"
#import "FBAuthorizationState.h"
#import "FBSignInAction.h"

@interface FBAuthViewController () <RxSubscriber>

@property (weak) IBOutlet NSTextField *userNameTextField;
@property (weak) IBOutlet NSSecureTextField *passwordTextField;
@property (weak) IBOutlet NSTextField *errorLabel;

@end

@implementation FBAuthViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupObserving];
}

- (void)setupObserving {
    [MainStore subscribe:self withStateSelector:^id<RxState>(FBAppState *state) {
        return state.authorization;
    }];
}

- (void)dealloc {
    [MainStore unsubscribe:self];
}

#pragma mark - <RxSubscriber>

- (void)onStateChanged:(id<FBAuthorizationState>)state {
    dispatch_async(dispatch_get_main_queue(), ^{
        guard_ret(![FBAuthorizationStateError cast:state], [self processError:state]);
        [self processAuthorizing];
    });
}

- (void)processError:(FBAuthorizationStateError *)state {
    self.errorLabel.stringValue = state.error.localizedDescription;
}

- (void)processAuthorizing {
    self.errorLabel.stringValue = @"";
}

#pragma mark - Actions

- (IBAction)loginButtonClicked:(id)sender {
    [MainStore dispatch:[[FBSignInAction alloc]
                         initWithUsername:self.userNameTextField.stringValue
                         password:self.passwordTextField.stringValue]];
}

@end
