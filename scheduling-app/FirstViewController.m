//
//  FirstViewController.m
//  scheduling-app
//
//  Created by Mac user on 7/13/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize mcController;

- (void)viewDidLoad {
    [super viewDidLoad];
    mcController = [[MCController alloc] init];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction) browseForSessions:(UIButton*)browseButton{
    [mcController setupPeerAndSessionWithDisplay:@"user1"];
    [mcController setupMCBrowser];
    [self presentViewController: mcController.browser animated:YES completion:nil];
}

-(IBAction) advertiseForSessions:(UIButton*)advertiseButton{
    [mcController setupPeerAndSessionWithDisplay:@"user1"];
    [mcController advertiseSelf:YES];
    [mcController.advertiser start];
}

@end
