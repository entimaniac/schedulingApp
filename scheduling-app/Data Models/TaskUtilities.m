//
//  TaskUtilies.m
//  scheduling-app
//
//  Created by William McCall on 7/16/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import "TaskUtilities.h"


@implementation TaskUtilities

+(UIColor *) getColorFromID:(NSNumber *)idNumber{
    switch ([idNumber intValue])
    {
        case redColor: return [UIColor redColor];
        case greenColor: return [UIColor greenColor];
        case blueColor: return [UIColor blueColor];
        default: return nil;
    }
}
@end
