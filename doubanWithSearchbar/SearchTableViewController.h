//
//  SearchTableViewController.h
//  doubanWithSearchbar
//
//  Created by Robin.Pan on 06/12/2016.
//  Copyright © 2016 Robin.Pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>

#import "SearchTableViewCell.h"

@interface SearchTableViewController : UITableViewController

@property ( strong, nonatomic ) IBOutlet UISearchBar *searchBar;
//@property ( strong, nonatomic) IBOutlet UITableView *TableView;

@end
