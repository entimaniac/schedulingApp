//
//  TaskDetailViewController.h
//  scheduling-app
//
//  Created by Mac user on 7/19/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Event.h"
#import "MCController.h"
#import "EditTaskViewController.h"

@interface TaskDetailViewController : UITableViewController <UIActionSheetDelegate>
    @property(strong, nonatomic) UIBarButtonItem *actionButton;
    @property(strong, nonatomic) UIActionSheet *actionSheet;
    @property(strong, nonatomic) MCController *mcController;
    @property(weak, nonatomic) Event *event;
    @property(weak, nonatomic) IBOutlet UILabel *titleLbl, *locationLbl, *startDateLbl, *endDateLbl;
    @property BOOL shouldAdvertise;
@end
