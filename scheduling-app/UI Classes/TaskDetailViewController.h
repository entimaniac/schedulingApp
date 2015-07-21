//
//  TaskDetailViewController.h
//  scheduling-app
//
//  Created by Mac user on 7/19/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Task.h"
#import "MCController.h"
#import "EditTaskViewController.h"
#import "TaskDetailShareViewController.h"

@interface TaskDetailViewController : UITableViewController <UIActionSheetDelegate, UIAlertViewDelegate>
    @property(strong, nonatomic) UIBarButtonItem *actionButton;
    @property(strong, nonatomic) UIActionSheet *actionSheet;
    @property(strong, nonatomic) MCController *mcController;
    @property(weak, nonatomic) Task *task;
    @property(weak, nonatomic) NSMutableArray *tasks;
    @property(weak, nonatomic) IBOutlet UILabel *titleLbl, *locationLbl, *startDateLbl, *endDateLbl;
    @property BOOL shouldAdvertise;
@end
