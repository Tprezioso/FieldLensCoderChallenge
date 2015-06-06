//
//  MovieTableViewCell.h
//  FieldLensCoderChallenge
//
//  Created by Thomas Prezioso on 6/6/15.
//  Copyright (c) 2015 Thomas Prezioso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *moviePoster;
@property (strong, nonatomic) IBOutlet UILabel *movieTitle;

@end
