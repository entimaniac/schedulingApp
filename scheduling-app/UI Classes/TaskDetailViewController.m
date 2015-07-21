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
@synthesize task, tasks, actionButton, actionSheet, mcController, shouldAdvertise, titleLbl, locationLbl, startDateLbl, endDateLbl;
-(void)viewDidLoad {
    NSDateFormatter *dForm = [[NSDateFormatter alloc] init];
    dForm.dateStyle = NSDateFormatterLongStyle;
    dForm.timeStyle = NSDateFormatterFullStyle;
    
    titleLbl.text = task.title;
    locationLbl.text = task.location;
    startDateLbl.text = [dForm stringFromDate:task.timeFrame.startTime];
    endDateLbl.text = [dForm stringFromDate:task.timeFrame.endTime];
    
    shouldAdvertise = YES;
    mcController = [[MCController alloc] init];
    
    actionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(navButtonPressed:)];
    self.navigationItem.rightBarButtonItem = actionButton;
    
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"MCC Share" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete" otherButtonTitles:@"Edit", @"Share MCC", nil];
    
    self.navigationItem.title = task.title;
}

-(void)navButtonPressed:(UIBarButtonItem*)navButton{
    if(navButton == actionButton) [actionSheet showFromBarButtonItem:navButton animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"editTaskSegue"]){
        EditTaskViewController *destVC = segue.destinationViewController;
        destVC.task = task;
    }
    else if([segue.identifier isEqualToString:@"shareTaskSegue"]){
        TaskDetailShareViewController *destVC = segue.destinationViewController;
        destVC.mcController = mcController;
        destVC.task = task;
    }
}

-(void)actionSheet:(UIActionSheet *)aSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == aSheet.firstOtherButtonIndex) [self performSegueWithIdentifier:@"editTaskSegue" sender:self];
    else if(buttonIndex == aSheet.firstOtherButtonIndex + 1) [self performSegueWithIdentifier:@"shareTaskSegue" sender:self];
    else if(buttonIndex == aSheet.destructiveButtonIndex){
        [tasks removeObject:task];
        [[[UIAlertView alloc] initWithTitle:@"Delete" message:@"Are you sure you want to delete this event?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil] show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == alertView.firstOtherButtonIndex){
        [tasks removeObject:task];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
