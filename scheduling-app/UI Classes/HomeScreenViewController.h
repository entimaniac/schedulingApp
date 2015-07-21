//
//  HomeScreenViewController.h
//  scheduling-app
//
//  Created by Mac user on 7/19/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Task.h"
#import "TaskDetailViewController.h"
#import "EditTaskViewController.h"

@interface HomeScreenViewController : UITableViewController
    @property(strong, nonatomic) NSMutableArray *tasks;
    @property(strong, nonatomic) UIRefreshControl *refreshControl;
@end