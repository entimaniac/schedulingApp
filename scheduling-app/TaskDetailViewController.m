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
    
    actionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(navButtonPressed:)];
    self.navigationItem.rightBarButtonItem = actionButton;
    
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"MCC Share" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete" otherButtonTitles:@"Edit", @"Browse", @"Advertise", nil];
    
    self.navigationItem.title = event.title;
}

-(void)navButtonPressed:(UIBarButtonItem*)navButton{
    if(navButton == actionButton) [actionSheet showFromBarButtonItem:navButton animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"editTaskSegue"]){
        EditTaskViewController *destVC = segue.destinationViewController;
        destVC.event = event;
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1) [self performSegueWithIdentifier:@"editTaskSegue" sender:self];
    else if(buttonIndex == 2){
        [mcController setupPeerAndSessionWithDisplay:@"user1"];
        [mcController setupMCBrowser];
        [self presentViewController:mcController.browser animated:YES completion:nil];
    } else if(buttonIndex == 2){
        [mcController setupPeerAndSessionWithDisplay:@"user1"];
        [mcController advertiseSelf:shouldAdvertise];
        shouldAdvertise = !shouldAdvertise;
    }
}
@end
