//
//  SearchTableViewController.m
//  doubanWithSearchbar
//
//  Created by Robin.Pan on 06/12/2016.
//  Copyright © 2016 Robin.Pan. All rights reserved.
//

#import "SearchTableViewController.h"
#import <MagicalRecord/MagicalRecord.h>
#import "bookObject.h"
#import "AppDelegate.h"
static NSString *const CELL_IDENTIFER = @"search_cell";

@interface SearchTableViewController () <UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating ,UITableViewDelegate, UITableViewDataSource>
{
    NSManagedObjectContext *context ;
	NSMutableArray *bookArray;  // data source from API
}
//@property (nonatomic,strong)NSArray *bookArray;

@property ( nonatomic, strong ) UISearchController *searchController ;

@end

@implementation SearchTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	context = [NSManagedObjectContext MR_defaultContext];
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


// ---------- End table view data source ----------

-( void ) updateSearchResultsForSearchController:(UISearchController *)searchController
{
	NSLog(@"updateSearchResultsForSearchController") ;
	[ self callForData ] ;
	//[ self.tableView reloadData ];
}

// set network request
-(void) callForData
{
	//Set get request URL
	NSString *base_url = @"https://api.douban.com/v2/book/search?q=" ;
	NSString *search_key = self.searchController.searchBar.text ;
	NSLog(@"Passed key = %@",search_key) ;
	NSString *final_url = [ NSString stringWithFormat:@"%@%@%@%@", base_url, search_key,@"&count=1",@"&fields=title,publisher,pages,image" ] ;
	NSLog(@"\n\n\nfinal_url is: %@\n\n\n", final_url) ;
	
	AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
	[manager GET:final_url parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
	 {
         
         NSLog(@"\n\n\n now we have------1----%@\n\n\n",responseObject);
        
		 bookArray = [ responseObject valueForKey:@"books" ] ;
        
         NSLog(@"\n\n\n now we have------2----%@\n\n\n",bookArray);
         
         for (NSDictionary *obj in bookArray) {
             //save to dataBase
          
             Book *newBook = [ Book MR_createEntity];
             //Book *newBook = [ Book MR_createEntityInContext:context];
             //Book *newBook = [ Book MR_findFirst];
         
            // NSLog(@"we have the book1111--%@",newBook);
             
           
             //save 方法1
             //NSLog(@"the default context is --!!!%@",context);
//             [context MR_saveWithOptions:MRSaveParentContexts completion:^(BOOL contextDidSave, NSError * _Nullable error) {
//                
//                 dispatch_async(dispatch_get_main_queue(), ^{
//                      NSLog(@"succ!!!");
//                     	 [ self.tableView reloadData ] ;
//                 });
//                 
//             }];
             
             
            //save方法2
             
             // [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
             [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
               //  Book *localBook = [newBook MR_inContext:localContext];
               //[ localBook addAttributes : obj] ;
              [ newBook addAttributes : obj] ;
                 
                 NSLog(@"\n\n\n now we have------3----%@\n\n\n",newBook);
                 NSLog(@"\n\n\n now we have------4----%@\n\n\n",obj);

//                 NSArray *array = [Book MR_findAll];
//                 if (!array) {
//                     NSLog(@"we have books-----%@----",array);
//                 }
//                 else{
//                     NSLog(@"save fail!!!!!");
//                 }
                 
             }completion:^(BOOL success, NSError *error) {
                 
                 
                 [ self.tableView reloadData ] ;
               NSLog(@"\n\n\n now we have------5----%@\n\n\n",responseObject);
                 // This block runs in main thread
             }];
             
             
         }
         
       

         
   
         
		 // This reload operation must be added
	
		 
	 } failure:^(NSURLSessionTask *operation, NSError *error)
	 {
		 NSLog(@"Error: %@", error);
	 }];
}




#pragma mark - tableView
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
        Book *newBook =  [ Book MR_createEntity];
        [newBook addAttributes: bookArray[indexPath.row]];
        // set a book cell to table view
        [ mycell setBooksToCell : newBook] ;
    }
    return mycell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // unselect
    [ tableView deselectRowAtIndexPath:indexPath animated:YES ] ;
//    if (self.searchController.active)
//    {
//        NSLog(@"%@", bookArray[indexPath.row]);
//    }
    // stop search
    self.searchController.active = NO ;
}

@end
