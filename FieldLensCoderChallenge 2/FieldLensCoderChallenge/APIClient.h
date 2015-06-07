//
//  APIClient.h
//  FieldLensCoderChallenge
//
//  Created by Anish Kumar on 6/6/15.
//  Copyright (c) 2015 Thomas Prezioso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIClient : NSObject


+ (void)getAllMoviesWithcompletionBlock: (void (^)(NSDictionary *arrays))completionBlock;

@end
