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
#import "MediaPackage.h"

@interface Task : NSObject

// Title of the Task
@property(strong, nonatomic) NSString *title;

// Array of Tags Stored as Strings
@property(strong, nonatomic) NSMutableArray *tags;

// Stores the ID of the color
// DO NOT TOUCH
@property(strong, nonatomic) NSNumber * colorTag;

// Stores all of the time frames in an array
// DO NOT TOUCH
@property(strong, nonatomic) NSArray * timeFrames;

// Stores the names of all of the media attachments
// DO NOT TOUCH
@property(strong, nonatomic) NSArray * mediaAddresses;

// Stores the string file of the notes
@property(strong, nonatomic) NSString * notes;

// Stores the reminder times
// DO NOT TOUCH
@property(strong,nonatomic) NSArray * reminderTimes;

// ID used to identify device across
// DO NOT TOUCH
@property(strong, nonatomic) NSString * internalID;


// Getter Methods
-(NSString *) getTitle;
-(NSArray *) getTags; // array of strings
-(UIColor *) getColorTag;
-(NSArray *) getTimeFrames; // array of time frame objects
-(NSArray *) getMediaFiles; // array of media objects
-(NSString *) getNotes;

// These setters do not fail
-(void) setTitle: (NSString *)newTitle;
-(void) setNotes:(NSString *)newnotes;

// These setters do
// fails on invalid ID
-(BOOL) setColor:(int) colorID;
// fails if index invalid
-(BOOL) setTagAtIndex:(int) index
                     :(NSString *) newTag;
// fails if timeframe or index invalid
-(BOOL) setTimeFrameAtIndex:(int) index
                           :(TimeFrame *) newTimeFrame;
// fails on invalid index
-(BOOL) setMediaAtIndex:(int) index
                       :(MediaPackage *) newMediaPackage;
// fails on invalid date or index
-(BOOL) setReminderAtIndex:(int) index
                          :(NSDate *)newReminder;



@end
