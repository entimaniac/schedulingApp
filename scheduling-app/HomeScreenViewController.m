//
//  HomeScreenViewController.m
//  scheduling-app
//
//  Created by Mac user on 7/19/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import "HomeScreenViewController.h"

@interface HomeScreenViewController()
@end

@implementation HomeScreenViewController
@synthesize events, eventView;

-(void) viewDidLoad{
    events = [[NSMutableArray alloc] init];
    eventView.dataSource = self;
    eventView.delegate = self;
}
-(void)viewDidAppear:(BOOL)animated{
    [eventView reloadData];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell"];
    
    if(cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"taskCell"];
    cell.textLabel.text = ((Event*)[events objectAtIndex:indexPath.row]).title;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [events count];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"taskSelectedSegue"]){
        TaskDetailViewController *destVC = segue.destinationViewController;
        destVC.event = [events objectAtIndex:[eventView indexPathForSelectedRow].row];
    }
    else if([segue.identifier isEqualToString:@"newTaskSegue"]){
        NewTaskViewController *destVC = segue.destinationViewController;
        destVC.events = events;
    }
}
@end