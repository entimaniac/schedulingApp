//
//  NewTaskViewController.m
//  scheduling-app
//
//  Created by Mac user on 7/19/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import "NewTaskViewController.h"

@interface NewTaskViewController()
@end

@implementation NewTaskViewController
@synthesize event, events, cancelButton, saveButton, titleField, locationField, startDate, endDate;

-(void) viewDidLoad{
    event = [[Event alloc] init];
    
    [titleField addTarget:self action:@selector(fieldChanged:) forControlEvents:UIControlEventEditingChanged];
    [locationField addTarget:self action:@selector(fieldChanged:) forControlEvents:UIControlEventEditingChanged];
    
    cancelButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(navButtonPressed:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    saveButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(navButtonPressed:)];
    saveButton.enabled = NO;
    self.navigationItem.rightBarButtonItem = saveButton;
    
}

-(void) navButtonPressed:(UIBarButtonItem*)navButton{
    if(navButton == saveButton) {
        event.title = titleField.text;
        event.location = locationField.text;
        [events addObject: event];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
    else if(navButton == cancelButton) {
        //UIAlert to make sure
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

-(void) fieldChanged:(UITextField*)field{
    if(field == titleField) self.navigationItem.title = titleField.text;
    saveButton.enabled = (titleField.text.length > 0 && locationField.text.length > 0);
}

@end