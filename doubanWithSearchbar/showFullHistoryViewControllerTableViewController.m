//
//  showFullHistoryViewControllerTableViewController.m
//  doubanWithSearchbar
//
//  Created by ernie.cheng on 12/7/16.
//  Copyright © 2016 Robin.Pan. All rights reserved.
//

#import "showFullHistoryViewControllerTableViewController.h"
#import <MagicalRecord/MagicalRecord.h>
#import "showFullHistoryTableViewCell.h"

@interface showFullHistoryViewControllerTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(strong,nonatomic) NSArray *books;

@end

@implementation showFullHistoryViewControllerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadData{
    //  [self fetchDatafromDataBase];
    
    self.books = [Book MR_findAll];
    
    //NSNumber *count = [Book MR_numberOfEntities];
    //    NSInteger *count1 = self.books.count;
    //    NSLog(@"the number of entity is ------%@--books array count is %i--",count,count1);
    //
    
    
    //    if (self.books) {
    //
    //        NSLog(@"we have books-----%@----",self.books);
    //    }
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"3!!@~~~");
    return 100;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.books.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    Book *Book = self.books[indexPath.row];
    
    NSLog(@"\n\n\n\n\n~~~`~~!!%@\n\n\n\n\n\n",Book);
    // Book *newBook =  [ Book MR_createEntity];
    //[newBook addAttributes: self.books[indexPath.row]];
    
    //Book *book = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    showFullHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fullHistoryTableViewCell"];
    
    
    //[cell setBooksToCell:newBook];
    [cell setBooksToCell:Book];
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
