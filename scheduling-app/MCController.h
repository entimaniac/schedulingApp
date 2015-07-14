//
//  MCController.h
//  scheduling-app
//
//  Created by Mac user on 7/14/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface MCController : UIViewController  <MCSessionDelegate, MCBrowserViewControllerDelegate, MCAdvertiserAssistantDelegate>
@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) MCSession *session;
@property (nonatomic, strong) MCBrowserViewController *browser;
@property (nonatomic, strong) MCAdvertiserAssistant *advertiser;
@property (nonatomic, strong) NSProgress *progress;


-(void)setupPeerAndSessionWithDisplay:(NSString *)displayName;
-(void)setupMCBrowser;
-(void)advertiseSelf:(BOOL)shouldAdvertise;
-(MCController*) init;

@end