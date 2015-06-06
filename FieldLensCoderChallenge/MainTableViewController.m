//
//  MainTableViewController.m
//  
//
//  Created by Thomas Prezioso on 6/6/15.
//
//

#import "MainTableViewController.h"
#import "MovieTableViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface MainTableViewController ()

@property (strong, nonatomic)NSMutableArray *titles;
@property (strong, nonatomic)NSMutableArray *images;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *url = @"http://api.themoviedb.org/3/movie/upcoming?api_key=45b53fed0a34751a8fda0043801d6e08";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    AFJSONRequestSerializer *serializer = [[AFJSONRequestSerializer alloc] init];
    
    manager.requestSerializer = serializer;
    
    [manager GET:url
       parameters:nil
          success:^(NSURLSessionDataTask *task, id responseObject)
    {
      self.titles = [[NSMutableArray alloc] init];
        self.images = [[NSMutableArray alloc] init];
        
        NSArray *movies = responseObject[@"results"];
        for(NSDictionary *movie in movies)
        {
            [self.titles addObject:movie[@"title"]];
            [self.images addObject:movie[@"poster_path"]];
        }
        
        //Put a completion block here to access the filled arrays.
    }
          failure:^(NSURLSessionDataTask *task, NSError *error)
    {
        NSLog(@"FAILURE: %@", error.localizedDescription);
        
    }];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.titles count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
     NSURL *imageURL = [[NSURL alloc]initWithString:self.images[indexPath.row]];
    
    cell.movieTitle.text = self.titles;
    [cell.imageView setImageWithURL:imageURL];
    
    // Configure the cell...
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
