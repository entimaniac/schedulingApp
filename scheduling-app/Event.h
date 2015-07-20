//
//  Event.h
//  scheduling-app
//
//  Created by Mac user on 7/19/15.
//  Copyright (c) 2015 com.justin. All rights reserved.
//

#import "Foundation/Foundation.h"

@interface Event : NSObject
    @property(strong, nonatomic) NSString *title, *location;
    @property(strong, nonatomic) NSDate *startDate, *endDate;
@end
