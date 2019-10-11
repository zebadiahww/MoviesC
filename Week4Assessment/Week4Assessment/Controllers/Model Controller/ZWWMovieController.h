//
//  ZWWMovieController.h
//  Week4Assessment
//
//  Created by Zebadiah Watson on 10/11/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWWMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZWWMovieController : NSObject

+(instancetype)shared;

@property(nonatomic, copy)NSArray<ZWWMovie *> * movie;

-(void)fetchMovieWithTitle: (NSString* )title
                completion:(void(^)(NSArray<ZWWMovie *>* movie))completion;

@end

NS_ASSUME_NONNULL_END
