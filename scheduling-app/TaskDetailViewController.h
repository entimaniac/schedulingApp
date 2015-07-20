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

@interface TaskDetailViewController : UIViewController <UIActionSheetDelegate>
    @property(strong, nonatomic) UIBarButtonItem *actionButton;
    @property(strong, nonatomic) UIActionSheet *actionSheet;
    @property(strong, nonatomic) MCController *mcController;
    @property(weak, nonatomic) Event *event;
    @property BOOL shouldAdvertise;
@end
