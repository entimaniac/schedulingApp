//
//  TaskUtilities.h
//  scheduling-app
//
//  Created by William McCall on 7/16/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIColor.h>

typedef enum {redColor, greenColor, blueColor} ColorID;

@interface TaskUtilities : NSObject

    // Returns a color based on the id number inputed
    +(UIColor *) getColorFromID:(NSNumber *)idNumber;

@end
