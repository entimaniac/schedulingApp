//
//  SettingsDetailViewController.m
//  scheduling-app
//
//  Created by Mac user on 7/20/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import "SettingsDetailViewController.h"

@interface SettingsDetailViewController()
@end

@implementation SettingsDetailViewController
@synthesize notificationSounds, indexPathSelectedCell;
-(void) viewDidLoad{
    notificationSounds = [[NSArray alloc] initWithContentsOfFile:@"notificationSounds.plist"];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"notificationSoundCell"];
    if(cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"notificationSoundCell"];
    
    cell.textLabel.text = [notificationSounds objectAtIndex: indexPath.row];

    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath != indexPathSelectedCell){
        [self.tableView cellForRowAtIndexPath:indexPathSelectedCell].accessoryType = nil;
        [self.tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        indexPathSelectedCell = indexPath;
    }
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return notificationSounds.count;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
@end
