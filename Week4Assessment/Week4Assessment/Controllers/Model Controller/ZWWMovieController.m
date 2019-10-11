//
//  ZWWMovieController.m
//  Week4Assessment
//
//  Created by Zebadiah Watson on 10/11/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import "ZWWMovieController.h"

static NSString * const kBaseURLString = @"https://api.themoviedb.org/3/";
static NSString * const kSearchComponent = @"search";
static NSString * const kApiKeyKey = @"api_key";
static NSString * const kApiKeyValue = @"df805281976a69f805e3cedd8c74c655";
static NSString * const kMovie = @"movie";
static NSString * const kQueryItem = @"query";
static NSString * const kImageUrl = @"https://image.tmdb.org/t/p/";
static NSString * const kSizeComponent = @"w500";


@implementation ZWWMovieController

+ (instancetype)shared
{
    static ZWWMovieController * sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        sharedController = [ZWWMovieController new];
    });
    return sharedController;
}
- (void)fetchMovieWithTitle:(NSString *)title completion:(void (^)(NSArray<ZWWMovie *> * _Nullable))completion
{
    NSURL *baseUrl = [NSURL URLWithString:kBaseURLString];
    NSURL *searchUrl = [baseUrl URLByAppendingPathComponent:kSearchComponent];
    NSURL *movieUrl = [searchUrl URLByAppendingPathComponent:kMovie];
    
    NSURLQueryItem * apiQueryItem = [[NSURLQueryItem alloc] initWithName:kApiKeyKey value:kApiKeyValue];
    NSURLQueryItem * movieQueryItem = [[NSURLQueryItem alloc] initWithName:kQueryItem value:title];
    
    NSURLComponents * components = [NSURLComponents componentsWithURL:movieUrl resolvingAgainstBaseURL:true];
    components.queryItems = @[apiQueryItem, movieQueryItem];
    
    NSURL * finalURL = components.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if(data)
        {
            NSDictionary * topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
                if (error)
                {
                NSLog(@"error parsing the data");
                completion(nil);
                return;
            }
            
            NSDictionary * resultsDictionary = topLevelDictionary[@"results"];
            
            NSMutableArray * arrayOfMovies = [NSMutableArray new];
            for (NSDictionary * movieDictionary in resultsDictionary)
            {
                ZWWMovie * movie = [[ZWWMovie alloc] initWIthDictionary:movieDictionary];
                [arrayOfMovies addObject:movie];
            }
            completion(arrayOfMovies);
        }
    }]resume];
    
}

@end
