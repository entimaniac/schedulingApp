//
//  TimeFrame.m
//  scheduling-app
//
//  Created by William McCall on 7/16/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import "TimeFrame.h"

@implementation TimeFrame
@synthesize startTime, endTime;

-(TimeFrame*) initWithStart:(NSDate*)start andEnd:(NSDate*) end{
    startTime = start;
    endTime = end;
    return self;
}

@end
