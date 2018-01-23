//
//  FBViewController.m
//  File Browser
//
//  Created by Danil Lisovoy on 1/19/18.
//  Copyright © 2018 Danil Lisovoy. All rights reserved.
//

#import "FBAuthViewController.h"

#import "FBWindowController.h"
#import "FBSignInAction.h"

@interface FBAuthViewController ()

@property (weak) IBOutlet NSTextField *userNameTextField;
@property (weak) IBOutlet NSSecureTextField *passwordTextField;

@end

@implementation FBAuthViewController

- (IBAction)loginButtonClicked:(id)sender {
    [MainStore dispatch:[[FBSignInAction alloc]
                         initWithUsername:self.userNameTextField.stringValue
                         password:self.passwordTextField.stringValue]];
}

@end
