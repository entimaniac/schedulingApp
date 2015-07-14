//
//  NewContactViewController.m
//  scheduling-app
//
//  Created by Mac user on 7/13/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import "NewEventViewController.h"

@interface NewEventViewController ()

@end

@implementation NewEventViewController
@synthesize saveButton, cancelButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [saveButton setEnabled:NO];
    
    
    cancelButton.action = @selector(didCancel:);
    cancelButton.target = self;
    
    saveButton.enabled = NO;
    saveButton.target = self;
    saveButton.action = @selector(didSave:);
}

-(void) didCancel:(UIBarButtonItem*)button{ [self.navigationController popToRootViewControllerAnimated:YES]; }

-(void) didSave:(UIBarButtonItem*)button{
    //do save
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
