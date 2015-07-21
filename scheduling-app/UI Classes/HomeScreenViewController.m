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
@synthesize tasks, refreshControl;

-(void) viewDidLoad{
    tasks = [[NSMutableArray alloc] init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}
-(void)viewDidAppear:(BOOL)animated{ [self.tableView reloadData]; }

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tasks removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell"];
    
    if(cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"taskCell"];
    cell.textLabel.text = ((Task*)[tasks objectAtIndex:indexPath.row]).title;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tasks.count > 0){
        if(tableView.backgroundView != nil) tableView.backgroundView = nil;
        if(tableView.separatorStyle != UITableViewCellSeparatorStyleSingleLine) tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        return tasks.count;
    }
    else{
        /*Else display an empty message*/
        UILabel *messageLabel = [[UILabel alloc] init];
        messageLabel.text = @"No tasks to show\nTo create a new task, tap ➕";
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

-(void) refreshTable {
    //pull in data from file
    [refreshControl endRefreshing];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"selectTaskSegue"]){
        TaskDetailViewController *destVC = segue.destinationViewController;
        destVC.task = [tasks objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        destVC.tasks = tasks;
    } else if([segue.identifier isEqualToString:@"newTaskSegue"]){
        EditTaskViewController *destVC = segue.destinationViewController;
        destVC.tasks = tasks;
    }
}
@end