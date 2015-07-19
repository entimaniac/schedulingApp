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

-(void)viewDidLoad{
    
}

-(MCController*) init {
    
    return self;
}
-(void)setupPeerAndSessionWithDisplay:(NSString *)displayName{
    /*setup PeerID*/
    peerID = [[MCPeerID alloc] initWithDisplayName:displayName];
    
    /*setup session*/
    session = [[MCSession alloc] initWithPeer: peerID];
    session.delegate = self;

}

-(void)setupMCBrowser{
    /*setup browser*/
    browser = [[MCBrowserViewController alloc] initWithServiceType:@"service" session:session];
    browser.delegate = self;
}

-(void)advertiseSelf:(BOOL)shouldAdvertise{
    if(advertiser == nil){
        advertiser = [[MCAdvertiserAssistant alloc] initWithServiceType:@"service" discoveryInfo:nil session: session];
        advertiser.delegate = self;
    }
    
    (shouldAdvertise ? [advertiser start] : [advertiser stop]);
}

-(void) session:(MCSession *)sess peer:(MCPeerID *)pID didChangeState:(MCSessionState)state{
    NSString *name = @"testFile.plist";
    NSURL *myURL = [[NSURL alloc] initWithString:name];
    
    if(state == MCSessionStateConnected) progress = [sess sendResourceAtURL:myURL withName:name toPeer:pID withCompletionHandler:^(NSError *error){NSLog(error.localizedDescription);}];
}

-(void) session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress{
    NSLog(@"Starting receiving");
}

-(void) session:(MCSession *)sess didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error{
    [sess disconnect];
}

-(void)session:(MCSession *)sess didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID{
    [sess disconnect];
}

-(void) session:(MCSession *)sess didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID{
    [sess disconnect];
}

-(void) browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController{
    [browserViewController dismissViewControllerAnimated:YES completion:nil];
}

-(void) browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController{
    [browserViewController dismissViewControllerAnimated:YES completion:nil];
}
@end