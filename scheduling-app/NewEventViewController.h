//
//  NewContactViewController.h
//  scheduling-app
//
//  Created by Mac user on 7/14/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewEventViewController : UIViewController <UITabBarDelegate>

@property(nonatomic, strong) IBOutlet UIBarButtonItem *saveButton;
@property(nonatomic, strong) IBOutlet UIBarButtonItem *cancelButton;

@end