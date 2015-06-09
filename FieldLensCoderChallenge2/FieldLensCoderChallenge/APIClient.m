//
//  APIClient.m
//  FieldLensCoderChallenge
//
//  Created by Thomas Prezioso on 6/6/15.
//  Copyright (c) 2015 Thomas Prezioso. All rights reserved.
//

#import "APIClient.h"
#import "MainTableViewController.h"
#import <AFNetworking.h>



@implementation APIClient


+(void)getAllMoviesWithcompletionBlock:(void (^)(NSDictionary *))completionBlock
{
    NSString *url = @"http://api.themoviedb.org/3/movie/upcoming?api_key=45b53fed0a34751a8fda0043801d6e08";
   
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    AFJSONRequestSerializer *serializer = [[AFJSONRequestSerializer alloc] init];
    
    manager.requestSerializer = serializer;
    
   
    [manager GET:url
      parameters:nil
         success:^(NSURLSessionDataTask *task, id responseObject)
     {
         
         NSMutableArray *titles = [[NSMutableArray alloc] init];
         NSMutableArray *images = [[NSMutableArray alloc] init];
         NSMutableArray *overview = [[NSMutableArray alloc]init];
         
         NSArray *movies = responseObject[@"results"];
         for(NSDictionary *movie in movies)
         {
             [titles addObject:movie[@"title"]];
             [images addObject:movie[@"poster_path"]];
             [overview addObject:movie[@"overview"]];
         }
         
         //Put a completion block here to access the filled arrays.
         completionBlock(@{@"titles": titles, @"images": images, @"overview": overview});
         
     }
         failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         NSLog(@"FAILURE: %@", error.localizedDescription);
         
     }];

}

@end
