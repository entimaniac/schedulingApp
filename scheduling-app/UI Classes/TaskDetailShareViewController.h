//
//  TaskDetailShareViewController.h
//  scheduling-app
//
//  Created by Mac user on 7/21/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "MCController.h"
#import "Task.h"

@interface TaskDetailShareViewController : UITableViewController
    @property(strong, nonatomic) MCController *mcController;
    @property(weak, nonatomic) IBOutlet UIButton *browseButton, *sendFileButton;
    @property(strong, nonatomic) IBOutlet UITextField *nameField;
    @property(strong, nonatomic) IBOutlet UISegmentedControl *advertisingSegCtrl;
    @property(strong, nonatomic) IBOutlet UITableView *dynamicTableView;
    @property(strong, nonatomic) Task *task;
@end