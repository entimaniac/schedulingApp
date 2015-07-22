//
//  SettingsViewController.h
//  scheduling-app
//
//  Created by Mac user on 7/19/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

typedef enum {CALENDAR_ALERT = 1005} soundID;

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "SettingsDetailViewController.h"

@interface SettingsViewController : UITableViewController
    @property(strong, nonatomic) NSDictionary *sound;
    @property(strong, nonatomic) NSArray *notificationSounds;
@end