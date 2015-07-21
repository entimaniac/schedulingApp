//
//  Task.h
//  scheduling-app
//
//  Created by William McCall on 7/16/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIColor.h>
#import "TimeFrame.h"
#import "TaskUtilities.h"
#import "MediaPackage.h"

@interface Task : NSObject


@property(strong, nonatomic) NSString *title; // Title of the Task
@property(strong, nonatomic) NSString *location; // Location of the Task
@property(strong, nonatomic) NSMutableArray *tags; // Array of Tags Stored as Strings
@property(strong, nonatomic) UIColor *colorTag; // Stores the ID of the color
@property(strong, nonatomic) TimeFrame *timeFrame; // Stores all of the time frames in an array
@property(strong, nonatomic) NSMutableArray *mediaAddresses; // Stores the names of all of the media attachments
@property(strong, nonatomic) NSString * notes; // Stores the string file of the notes
@property(strong,nonatomic) NSMutableArray * reminderTimes; // Stores the reminder times
@property(strong, nonatomic) NSString * internalID; // ID used to identify device across


// Getter Methods
-(NSString *) getTitle;
-(NSArray *) getTags; // array of strings
-(UIColor *) getColorTag;
-(NSArray *) getTimeFrame; // array of time frame objects
-(NSArray *) getMediaFiles; // array of media objects
-(NSString *) getNotes;

// These setters do not fail
-(void) setTitle: (NSString *)newTitle;
-(void) setNotes:(NSString *)newnotes;

// These setters do
// fails on invalid ID
-(BOOL) setColor:(UIColor*)colorID;
// fails if index invalid
-(BOOL) setTag:(NSString *)newTag atIndex:(int)index;
// fails if timeframe or index invalid
-(void) setTimeFrame:(TimeFrame *)newTimeFrame;
// fails on invalid index
-(BOOL) setMedia:(MediaPackage *) newMediaPackage atIndex:(int) index;
// fails on invalid date or index
-(BOOL) setReminder:(NSDate *)newReminder atIndex:(int) index;



@end
