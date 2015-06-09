//
//  APIClient.m
//  FieldLensCoderChallenge
//
//  Created by Thomas Prezioso on 6/6/15.
//  Copyright (c) 2015 Thomas Prezioso. All rights reserved.
//

#import "APIClient.h"
#import "MainTableViewController.h"
#import "Constants.h"
#import <AFNetworking.h>


@implementation APIClient


+(void)getAllMoviesWithcompletionBlock:(void (^)(NSDictionary *))completionBlock
{
   AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    AFJSONRequestSerializer *serializer = [[AFJSONRequestSerializer alloc] init];
    
    manager.requestSerializer = serializer;
    
    NSOperationQueue *primeQueue = [[NSOperationQueue alloc]init];
    primeQueue.maxConcurrentOperationCount = 10;
    
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        [manager GET:API_URL
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

   
    }];
    
         [primeQueue addOperation:operation];
}

@end
