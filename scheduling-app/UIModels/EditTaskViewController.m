//
//  NewTaskViewController.m
//  scheduling-app
//
//  Created by Mac user on 7/19/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import "EditTaskViewController.h"

@interface EditTaskViewController()
@end

@implementation EditTaskViewController
@synthesize event, events, cancelButton, saveButton, titleField, locationField, startDatePicker, endDatePicker;

-(void) viewDidLoad{
/*Initialize event if nil*/
    if(event == nil){
        event = [[Event alloc] init];
        startDatePicker.date = [NSDate date];
        endDatePicker.date = [[NSDate date] addTimeInterval:60];
    }
/*Propogate Text Fields if and Event was Passed In*/
    else{
        titleField.text = event.title;
        locationField.text = event.location;
        startDatePicker.date = event.startDate;
        endDatePicker.date = event.endDate;
    }
/*Add Actions to UI Elements*/
    [titleField addTarget:self action:@selector(fieldChanged:) forControlEvents:UIControlEventEditingChanged];
    [locationField addTarget:self action:@selector(fieldChanged:) forControlEvents:UIControlEventEditingChanged];
    [startDatePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    [endDatePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
/*Initialize and Place UITabBarButton elements*/
    if(cancelButton == nil) cancelButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(navButtonPressed:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    if(saveButton == nil) saveButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(navButtonPressed:)];
    saveButton.enabled = (titleField.text.length > 0 && locationField.text.length);
    self.navigationItem.rightBarButtonItem = saveButton;
}

-(void) navButtonPressed:(UIBarButtonItem*)navButton{
    if(navButton == saveButton) {
        event.title = titleField.text;
        event.location = locationField.text;
        event.startDate = startDatePicker.date;
        event.endDate = endDatePicker.date;
        [events addObject: event];
        [self.navigationController popViewControllerAnimated:YES];
    } else if(navButton == cancelButton) {
        [[[UIAlertView alloc] initWithTitle: @"Cancel" message: @"Are you sure you want to cancel?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil] show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == alertView.firstOtherButtonIndex) [self.navigationController popViewControllerAnimated:YES];
    
}

-(void) fieldChanged:(UITextField*)field{
    if(field == titleField) self.navigationItem.title = titleField.text;
    saveButton.enabled = (titleField.text.length > 0 && locationField.text.length > 0);
}

-(void) datePickerChanged:(UIDatePicker*)datePicker{
    if(datePicker == startDatePicker){
        startDatePicker.minimumDate = [NSDate date];
        endDatePicker.minimumDate = [startDatePicker.date addTimeInterval:60];
    } else if(datePicker == endDatePicker) endDatePicker.minimumDate = [startDatePicker.date addTimeInterval:60];
}

@end