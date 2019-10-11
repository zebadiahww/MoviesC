//
//  ZWWMovie.h
//  Week4Assessment
//
//  Created by Zebadiah Watson on 10/11/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWWMovie : NSObject

@property (nonatomic, copy, readonly)NSString * title;
@property (nonatomic) double rating;
@property (nonatomic, copy, readonly)NSString * overview;
@property (nonatomic, copy, readonly, nullable)NSString * poster;

-(ZWWMovie *)initWIthTitle:(NSString *)title
                    rating:(double)rating
                  overview:(NSString *)overview
                    poster:(NSString *)poster;

@end

@interface ZWWMovie (JSONConvertable)

-(ZWWMovie *)initWIthDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
