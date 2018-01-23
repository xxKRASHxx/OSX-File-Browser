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
@property (weak) IBOutlet NSTextField *passwordTextField;

@end

@implementation FBAuthViewController

- (void)viewDidAppear {
    [super viewDidAppear];
    
}

- (IBAction)loginButtonClicked:(id)sender {
    [MainStore dispatch:[[FBSignInAction alloc] initWithUsername:@"test" password:@"ohiCanRun1"]];
}
@end
