//
//  SettingDetailViewController.h
//  scheduling-app
//
//  Created by Mac user on 7/20/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "SettingsViewController.h"

@interface SettingsDetailViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
    @property(strong, nonatomic) NSIndexPath *indexPathSelectedCell;
    @property soundID *notificationName;
    @property(strong, nonatomic) NSArray *notificationSounds;
@end
