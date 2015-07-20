//
//  TaskDetailViewController.m
//  scheduling-app
//
//  Created by Mac user on 7/19/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import "TaskDetailViewController.h"

@interface TaskDetailViewController()
@end

@implementation TaskDetailViewController
@synthesize event, actionButton, actionSheet, mcController, shouldAdvertise;
-(void)viewDidLoad{
    shouldAdvertise = YES;
    mcController = [[MCController alloc] init];
    
    actionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionButtonPressed:)];
    self.navigationItem.rightBarButtonItem = actionButton;
    
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"MCC Share" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete" otherButtonTitles:@"Browse", @"Advertise", nil];
    
    self.navigationItem.title = event.title;
}

-(void)actionButtonPressed:(UIBarButtonItem*)button{
    [actionSheet showFromBarButtonItem:button animated:YES];
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        [mcController setupPeerAndSessionWithDisplay:@"user1"];
        [mcController setupMCBrowser];
        [self presentViewController:mcController.browser animated:YES completion:nil];
    }
    else if(buttonIndex == 2){
        [mcController setupPeerAndSessionWithDisplay:@"user1"];
        [mcController advertiseSelf:shouldAdvertise];
        shouldAdvertise = !shouldAdvertise;
    }
}
@end
