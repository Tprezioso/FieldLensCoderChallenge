//
//  MovieDetailViewController.h
//  FieldLensCoderChallenge
//
//  Created by Thomas Prezioso on 6/7/15.
//  Copyright (c) 2015 Thomas Prezioso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailViewController : UIViewController
@property (strong, nonatomic) NSString *titleOfMovie;
@property (strong,nonatomic) UIImage *moviePosterImage;
@property(strong,nonatomic)NSString *overview;
@end
