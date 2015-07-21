//
//  TaskDetailShareViewController.m
//  scheduling-app
//
//  Created by Mac user on 7/21/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import "TaskDetailShareViewController.h"

@interface TaskDetailShareViewController()
@end

@implementation TaskDetailShareViewController
@synthesize task, advertisingSegCtrl, nameField, dynamicTableView, mcController, browseButton, sendFileButton;
-(void) viewDidLoad{
    dynamicTableView.delegate = self;
    dynamicTableView.dataSource = self;
    
    browseButton.enabled = sendFileButton.enabled = advertisingSegCtrl.enabled = false;
    
    [nameField addTarget:self action:@selector(nameFieldValueChanged:) forControlEvents:UIControlEventValueChanged];
    [browseButton addTarget:self action:@selector(browse) forControlEvents:UIControlEventTouchUpInside];
    [sendFileButton addTarget:self action:@selector(sendTask) forControlEvents:UIControlEventTouchUpInside];
    [advertisingSegCtrl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
}

-(void) nameFieldValueChanged:(UITextField*)field{
    if(browseButton.enabled != field.text.length > 1)
        browseButton.enabled = sendFileButton.enabled = advertisingSegCtrl.enabled = (field.text.length > 1 ? true :false);
}

-(void) browse{
    [mcController setupPeerAndSessionWithDisplay:nameField.text];
    [mcController setupMCBrowser];
    [self presentViewController:mcController.browser animated:YES completion:nil];
}
-(void) sendTask{
    if(mcController.session.connectedPeers.count < 1) {
        [[[UIAlertView alloc]initWithTitle:@"Not Connected" message:@"Not Connected to any Peers" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
       return;
    }
    
    NSData *data = nil;//[NSKeyedArchiver archivedDataWithRootObject:task];
    NSError* error;
    if([mcController.session sendData:data toPeers:mcController.session.connectedPeers withMode:MCSessionSendDataReliable error:&error]){
        /*be happy*/
    }
    else{
        /*be sad*/
    }
}

-(void) segmentedControlValueChanged:(UISegmentedControl*)segCtrl{
    BOOL isOn = segCtrl.selectedSegmentIndex == 1;
    [mcController setupPeerAndSessionWithDisplay:nameField.text];
    [mcController advertiseSelf: isOn];
    nameField.enabled = !isOn;
}
/*
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"peerCell"];
    
    if(cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"peerCell"];
    
    cell.textLabel.text = ((MCPeerID*)[mcController.session.connectedPeers objectAtIndex:indexPath.row]).displayName;
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(mcController.session.connectedPeers.count > 0){
        if(tableView.backgroundView != nil) tableView.backgroundView = nil;
        if(tableView.separatorStyle != UITableViewCellSeparatorStyleSingleLine) tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        return mcController.session.connectedPeers.count;
    }
    else{
        //Else display an empty message
        UILabel *messageLabel = [[UILabel alloc] init];
        messageLabel.text = @"No connected hosts\nTap Browse to Connect";
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        [messageLabel sizeToFit];
        //messageLabel.backgroundColor = [UIColor blueColor];
        //messageLabel.textColor = [UIColor whiteColor];
        dynamicTableView.backgroundView = messageLabel;
        dynamicTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return 0;
    }
}
*/
@end
