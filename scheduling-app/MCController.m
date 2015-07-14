//
//  MCController.m
//  scheduling-app
//
//  Created by Mac user on 7/14/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCController.h"

@interface MCController()
@end

@implementation MCController
@synthesize session, peerID, browser, advertiser, progress;
-(void)setupPeerAndSessionWithDisplay:(NSString *)displayName{
    peerID = [[MCPeerID alloc] initWithDisplayName:displayName];
    session = [[MCSession alloc] initWithPeer: peerID];
}

-(void)setupMCBrowser{
    MCBrowserViewController *browserVC = [[MCBrowserViewController alloc] initWithServiceType:@"" session:session];
    browserVC.delegate = self;
    
    //[self presentViewController:browserVC animated: YES completion:nil];
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

-(void) browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController{
    
}

-(void) browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController{
    
}
@end