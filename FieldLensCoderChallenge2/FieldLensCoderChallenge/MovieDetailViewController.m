//
//  MovieDetailViewController.m
//  FieldLensCoderChallenge
//
//  Created by Thomas Prezioso on 6/7/15.
//  Copyright (c) 2015 Thomas Prezioso. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MainTableViewController.h"

@interface MovieDetailViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *movieImage;
@property (strong, nonatomic) IBOutlet UILabel *movieTitle;
@property (strong, nonatomic) IBOutlet UILabel *movieDescription;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setLabels];
    
    
}
-(void)setLabels{
    
    self.movieTitle.text = self.titleOfMovie;
   
    self.movieImage.image = self.moviePosterImage;
    
    self.movieDescription.text = self.overview;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
