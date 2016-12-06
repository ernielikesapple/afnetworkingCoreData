//
//  SearchTableViewController.m
//  doubanWithSearchbar
//
//  Created by Robin.Pan on 06/12/2016.
//  Copyright © 2016 Robin.Pan. All rights reserved.
//

#import "SearchTableViewController.h"

static NSString *const CELL_IDENTIFER = @"search_cell";

@interface SearchTableViewController () <UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating ,UITableViewDelegate, UITableViewDataSource>
{
	NSMutableArray *bookArray;  // data source from API
}

@property ( nonatomic, strong ) UISearchController *searchController ;

@end

@implementation SearchTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// must implement
	self.tableView.tableHeaderView = self.searchController.searchBar;
	
	// remove the shadow field
	_searchController.dimsBackgroundDuringPresentation = NO;
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning] ;
}

// set search cotroller
- ( UISearchController * )searchController
{
	if (!_searchController)
	{
		_searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
		_searchController.searchResultsUpdater = self;
		// Turn off caps lock
	}
	return _searchController;
}

// ---------- Table view data source ----------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-( CGFloat ) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return bookArray.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	SearchTableViewCell *mycell = [ self.tableView dequeueReusableCellWithIdentifier : CELL_IDENTIFER ];
	if ( !mycell )
	{
		mycell =[ [ SearchTableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_IDENTIFER ] ;
	}
	if (_searchController.active)
	{
		// add a book to book object
		bookObject *newBook = [ [ bookObject alloc ] init ];
		[ newBook addAttributes : bookArray[indexPath.row] ] ;
		// set a book cell to table view
		[ mycell setBooksToCell : newBook] ;
	}
	return mycell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// unselect
	[ tableView deselectRowAtIndexPath:indexPath animated:YES ] ;
	if (self.searchController.active)
	{
		NSLog(@"%@", bookArray[indexPath.row]);
	}
	// stop search
	self.searchController.active = NO ;
}

// ---------- End table view data source ----------

-( void ) updateSearchResultsForSearchController:(UISearchController *)searchController
{
	NSLog(@"updateSearchResultsForSearchController") ;
	[ self callForData ] ;
	[ self.tableView reloadData ];
}

// set network request
-(void) callForData
{
	//Set get request URL
	NSString *base_url = @"https://api.douban.com/v2/book/search?q=" ;
	NSString *search_key = self.searchController.searchBar.text ;
	NSLog(@"Passed key = %@",search_key) ;
	NSString *final_url = [ NSString stringWithFormat:@"%@%@%@", base_url, search_key, @"&fields=title,publisher,pages,image,summary" ] ;
	NSLog(@"\n\n\nfinal_url is: %@\n\n\n", final_url) ;
	
	AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
	[manager GET:final_url parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
	 {
		 bookArray= [ responseObject valueForKey:@"books" ] ;
		 
		 // This reload operation must be added
		 [ self.tableView reloadData ] ;
		 
	 } failure:^(NSURLSessionTask *operation, NSError *error)
	 {
		 NSLog(@"Error: %@", error);
	 }];
}

@end
