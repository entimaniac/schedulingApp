//
//  TaskUtilies.m
//  scheduling-app
//
//  Created by William McCall on 7/16/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import "TaskUtilies.h"


@implementation TaskUtilies

+(UIColor *) getColorFromID:(NSNumber *)idNumber{
    switch ([idNumber intValue])
    {
        case 1:
            return [UIColor redColor];
        case 2:
            return [UIColor greenColor];
        case 3:
            return [UIColor blueColor];
        default:
            return NULL;
    }
}
@end
