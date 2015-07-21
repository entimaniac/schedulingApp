//
//  NewTaskViewController.h
//  scheduling-app
//
//  Created by Mac user on 7/19/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface EditTaskViewController : UITableViewController <UIAlertViewDelegate>
    @property(strong, nonatomic) Task *task;
    @property(weak, nonatomic) NSMutableArray *tasks;
    @property(weak, nonatomic) IBOutlet UIDatePicker *startDatePicker, *endDatePicker;
    @property(weak, nonatomic) IBOutlet UITextField *titleField, *locationField;
    @property(strong, nonatomic) UIBarButtonItem *saveButton, *cancelButton;
@end
