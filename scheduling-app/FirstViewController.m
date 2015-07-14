//
//  FirstViewController.m
//  scheduling-app
//
//  Created by Mac user on 7/13/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import <MultipeerConnectivity/MultipeerConnectivity.h>
#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize peerID, session, browser, advertiser, progress;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupPeerAndSessionWithDisplay:(NSString *)displayName{
    peerID = [[MCPeerID alloc] initWithDisplayName:displayName];
    session = [[MCSession alloc] initWithPeer: peerID];
}

-(IBAction) beginSession:(UIButton*)beginButton{
    MCBrowserViewController *browserVC = [[MCBrowserViewController alloc] initWithServiceType: @"" session:session];

    browserVC.delegate = self;
    [self presentViewController:browserVC animated: YES completion:nil];
}

-(void)setupMCBrowser{

}

-(void)advertiseSelf:(BOOL)shouldAdvertise{
    if(shouldAdvertise);
}

-(void) session:(MCSession *)sess peer:(MCPeerID *)pID didChangeState:(MCSessionState)state{
    NSURL *myURL;
    NSString *name;
    if(state == MCSessionStateConnected) progress = [sess sendResourceAtURL:myURL withName:name toPeer:pID withCompletionHandler:^(NSError *error){NSLog(error.localizedDescription);}];
}

-(void) session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress{
    
}

-(void) session:(MCSession *)sess didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error{
    [sess disconnect];
}

-(void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID{
    
}

-(void) session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID{
    
}

@end
