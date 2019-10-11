//
//  ZWWMovie.m
//  Week4Assessment
//
//  Created by Zebadiah Watson on 10/11/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import "ZWWMovie.h"

static NSString * const kTitle = @"original_title";
static NSString * const kRating = @"vote_average";
static NSString * const kOverview = @"overview";
static NSString * const kPoster = @"poster_path";

@implementation ZWWMovie

- (ZWWMovie *)initWIthTitle:(NSString *)title rating:(double)rating overview:(NSString *)overview poster:(NSString *)poster
{
    if (self = [super init])
    {
        //initialize self
        _title = title;
        _rating = rating;
        _overview = overview;
        _poster = poster;
    }
    return self;
}

@end

@implementation ZWWMovie (JSONConvertable)

- (ZWWMovie *)initWIthDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    
    NSString *title = dictionary[kTitle];
    double rating =  [dictionary[kRating] doubleValue];
    NSString *overview = dictionary[kOverview];
    NSString *poster = dictionary[kPoster];
    
    return [self initWIthTitle:title rating:rating overview:overview poster:poster];
}

@end
