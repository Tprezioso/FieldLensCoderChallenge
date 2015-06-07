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

@interface MainTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)NSMutableArray *titles;
@property (strong, nonatomic)NSMutableArray *images;
@property(strong, nonatomic)NSMutableArray *overview;




@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [APIClient getAllMoviesWithcompletionBlock:^(NSDictionary *arrays) {
        self.titles = arrays[@"titles"];
        self.images = arrays[@"images"];
        self.overview = arrays[@"overview"];
        [self.tableView reloadData];
    }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
     if ([segue.identifier isEqualToString:@"detailMovie"]) {
         
         MovieDetailViewController *detailVC = segue.destinationViewController;
         
         NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
         
         
         detailVC.titleOfMovie = self.titles[selectedIndexPath.row];
         detailVC.moviePosterImage = self.images[selectedIndexPath.row];
         detailVC.overview = self.overview[selectedIndexPath.row];
         
         
     }
     
 
 }
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self performSegueWithIdentifier:@"detailMovie" sender:self];
//    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//}


@end
