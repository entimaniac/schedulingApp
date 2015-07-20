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
@synthesize events, eventView, refreshControl;

-(void) viewDidLoad{
    events = [[NSMutableArray alloc] init];
    eventView.dataSource = self;
    eventView.delegate = self;
    
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
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
    if([events count] > 0){
        if(tableView.backgroundView != nil) tableView.backgroundView = nil;
        if(tableView.separatorStyle != UITableViewCellSeparatorStyleSingleLine) tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        return [events count];
    }
    else{
        /*Else display an empty message*/
        UILabel *messageLabel = [[UILabel alloc] init];
        messageLabel.text = @"No events to show\nTo create a new event, tap ➕";
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        [messageLabel sizeToFit];
        //messageLabel.backgroundColor = [UIColor blueColor];
        //messageLabel.textColor = [UIColor whiteColor];
        tableView.backgroundView = messageLabel;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return 0;
    }
}

-(void) refreshTable{
    [refreshControl endRefreshing];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"selectTaskSegue"]){
        TaskDetailViewController *destVC = segue.destinationViewController;
        destVC.event = [events objectAtIndex:[eventView indexPathForSelectedRow].row];
        destVC.events = events;
    } else if([segue.identifier isEqualToString:@"newTaskSegue"]){
        EditTaskViewController *destVC = segue.destinationViewController;
        destVC.events = events;
    }
}
@end