//
//  MainTableViewController.m
//
//
//  Created by Thomas Prezioso on 6/6/15.
//
//

#import "MainTableViewController.h"
#import "APIClient.h"
#import "MovieTableViewCell.h"
#import "MovieDetailViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <MBProgressHUD.h>


@interface MainTableViewController ()

@property (strong, nonatomic)NSMutableArray *titles;
@property (strong, nonatomic)NSMutableArray *images;
@property(strong, nonatomic)NSMutableArray *overview;




@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSOperationQueue *mainLoad = [[NSOperationQueue alloc]init];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    [APIClient getAllMoviesWithcompletionBlock:^(NSDictionary *arrays) {
        
        
        self.titles = arrays[@"titles"];
        self.images = arrays[@"images"];
        self.overview = arrays[@"overview"];
        [self.tableView reloadData];
        
        
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];

    
}



#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.titles count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    
     NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://image.tmdb.org/t/p/original%@?api_key=45b53fed0a34751a8fda0043801d6e08", self.images[indexPath.row]]];
   
    [cell.moviePoster setImageWithURL:pictureURL];
    
    cell.movieTitle.text = self.titles[indexPath.row];
    
    return cell;
}




 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
     if ([segue.identifier isEqualToString:@"detailMovie"]) {
         
         MovieDetailViewController *detailVC = segue.destinationViewController;
         
         NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
         
          MovieTableViewCell *selectedCell = (MovieTableViewCell *)[self.tableView cellForRowAtIndexPath:selectedIndexPath];
         
         detailVC.titleOfMovie = self.titles[selectedIndexPath.row];
         detailVC.moviePosterImage = selectedCell.moviePoster.image;
         detailVC.overview = self.overview[selectedIndexPath.row];
         
         
     }
     
 
}
@end
