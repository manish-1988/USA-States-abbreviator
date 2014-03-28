//
//  USStatesAbbreviator.m
//  us states abbreviator
//
//  Created by Sudeep Jaiswal on 24/03/14.
//  Copyright (c) 2014 Sudeep Jaiswal. All rights reserved.

#import "USStatesAbbreviator.h"

@implementation USStatesAbbreviator

-(NSArray *)getStateNames {
    
    NSString *directoryPath = [[NSBundle mainBundle] pathForResource:@"states" ofType:@"plist"];
    NSArray *states = [[NSArray alloc] initWithContentsOfFile:directoryPath];
    return states;
}

-(NSArray *)getStateAbbreviations {
    
    NSString *directoryPath = [[NSBundle mainBundle] pathForResource:@"abbreviations" ofType:@"plist"];
    NSArray *abbreviations = [[NSArray alloc] initWithContentsOfFile:directoryPath];
    return abbreviations;
}

-(NSString *)abbreviateStateOfLocationWithName:(NSString *)locationName {
    
    NSArray *states = [self getStateNames];
    NSArray *abbreviations = [self getStateAbbreviations];
    NSArray *array = [locationName componentsSeparatedByString:@", "];
    NSString *stateName = [[array lastObject] lowercaseString];
    
    for (int i = 0 ; i < [states count] ; i++) {
        
        NSRange range = [stateName rangeOfString:[states objectAtIndex:i]];
        if (range.location != NSNotFound) {
            
            NSMutableString *newLocationString = [[NSMutableString alloc] init];
            
            for (int i = 0 ; i < [array count] - 1 ; i++) {
                [newLocationString appendString:[array objectAtIndex:i]];
                [newLocationString appendString:@", "];
            }
            
            [newLocationString appendString:[abbreviations objectAtIndex:i]];
            NSString *newLocation = [NSString stringWithString:newLocationString];
            return newLocation;
        }
    }
    return locationName;
}


@end
