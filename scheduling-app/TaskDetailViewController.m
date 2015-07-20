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
@synthesize event, events, actionButton, actionSheet, mcController, shouldAdvertise, titleLbl, locationLbl, startDateLbl, endDateLbl;
-(void)viewDidLoad {
    NSDateFormatter *dForm = [[NSDateFormatter alloc] init];
    dForm.dateStyle = NSDateFormatterLongStyle;
    dForm.timeStyle = NSDateFormatterFullStyle;
    
    titleLbl.text = event.title;
    locationLbl.text = event.location;
    startDateLbl.text = [dForm stringFromDate:event.startDate];
    endDateLbl.text = [dForm stringFromDate:event.endDate];
    
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

-(void)actionSheet:(UIActionSheet *)aSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == aSheet.firstOtherButtonIndex) [self performSegueWithIdentifier:@"editTaskSegue" sender:self];
    else if(buttonIndex == aSheet.firstOtherButtonIndex + 1){
        [mcController setupPeerAndSessionWithDisplay:@"user1"];
        [mcController setupMCBrowser];
        [self presentViewController:mcController.browser animated:YES completion:nil];
    } else if(buttonIndex == aSheet.firstOtherButtonIndex + 2){
        [mcController setupPeerAndSessionWithDisplay:@"user1"];
        [mcController advertiseSelf:shouldAdvertise];
        shouldAdvertise = !shouldAdvertise;
    }else if(buttonIndex == aSheet.destructiveButtonIndex){
        [events removeObject:event];
        [[[UIAlertView alloc] initWithTitle:@"Delete" message:@"Are you sure you want to delete this event?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil] show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == alertView.firstOtherButtonIndex){
        [events removeObject:event];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
