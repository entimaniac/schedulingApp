//
//  NewContactViewController.m
//  scheduling-app
//
//  Created by Mac user on 7/13/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import "NewContactViewController.h"

@interface NewContactViewController ()

@end

@implementation NewContactViewController
@synthesize saveButton, cancelButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [saveButton setEnabled:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"Did Press Save");
}
@end
