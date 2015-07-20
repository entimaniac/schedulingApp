//
//  HomeScreenViewController.h
//  scheduling-app
//
//  Created by Mac user on 7/19/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Event.h"
#import "TaskDetailViewController.h"
#import "NewTaskViewController.h"

@interface HomeScreenViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
    @property(strong, nonatomic) NSMutableArray *events;
    @property(strong, nonatomic) UITableView *eventView;
@end