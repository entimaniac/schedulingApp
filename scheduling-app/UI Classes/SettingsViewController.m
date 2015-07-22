//
//  SettingsViewController.m
//  scheduling-app
//
//  Created by Mac user on 7/19/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//


#import "SettingsViewController.h"
@interface SettingsViewController()
@end

@implementation SettingsViewController
@synthesize sound, notificationSounds;
-(void) viewDidLoad{
    notificationSounds = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"notificationSounds" ofType:@"plist"]];
    sound = [notificationSounds objectAtIndex:0];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"notificationSoundSelection"]){
        SettingsDetailViewController *destVC = segue.destinationViewController;
        destVC.notificationSounds = notificationSounds;
    }
}
@end