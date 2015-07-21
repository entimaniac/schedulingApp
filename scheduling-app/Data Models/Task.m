//
//  Task.m
//  scheduling-app
//
//  Created by William McCall on 7/16/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import "Task.h"

@implementation Task
@synthesize title, timeFrame, tags, colorTag, mediaAddresses, notes, reminderTimes;

/*CUSTOM GETTERS*/
-(NSString *) getTitle{ return title; }
-(NSArray *) getTags{ return tags; } // array of strings
-(UIColor *) getColorTag{ return colorTag;}
-(TimeFrame*) getTimeFrame{ return timeFrame;} // array of time frame objects
-(NSArray *) getMediaFiles{ return mediaAddresses; } // array of media objects
-(NSString *) getNotes{return notes;}

/*CUSTOM SETTERS*/
-(void) setTitle: (NSString *)newTitle{
    if(newTitle!= nil && newTitle.length > 0) title = newTitle;
}
-(void) setNotes:(NSString *)newNotes{
    if(newNotes != nil && newNotes.length > 0) notes = newNotes;
}

-(BOOL) setColor:(UIColor*)newColorTag{
    if(newColorTag == nil) return NO;
    colorTag = newColorTag;
    return YES;
}

// fails if index invalid or if string is empty or nil
-(BOOL) setTag:(NSString *)newTag atIndex:(int)index{
    if(index >= tags.count || newTag == nil || newTag.length < 1) return NO;
    [tags replaceObjectAtIndex:index withObject:newTag];
    return YES;
}
// fails if timeframe or index invalid
-(void) setTimeFrame:(TimeFrame *)newTimeFrame{ if(newTimeFrame != nil) timeFrame = newTimeFrame;}
// fails on invalid index or if MediaPackage is empty or nil
-(BOOL) setMedia:(MediaPackage *) newMediaPackage atIndex:(int) index{
    if(index >= mediaAddresses.count || newMediaPackage == nil) return NO;
    [mediaAddresses replaceObjectAtIndex:index withObject:newMediaPackage];
    return YES;
}
// fails on invalid date or index
-(BOOL) setReminder:(NSDate *)newReminder atIndex:(int) index{
    if(index >= reminderTimes.count || newReminder == nil) return NO;
    [reminderTimes replaceObjectAtIndex:index withObject: newReminder];
    return YES;
}

@end
