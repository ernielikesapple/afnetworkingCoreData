//
//  showFullHistoryViewController.m
//  doubanWithSearchbar
//
//  Created by ernie.cheng on 12/6/16.
//  Copyright © 2016 Robin.Pan. All rights reserved.
//

#import "showFullHistoryViewController.h"
#import <MagicalRecord/MagicalRecord.h>
#import "showFullHistoryTableViewCell.h"
#import "AppDelegate.h"

@interface showFullHistoryViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *books;
@end

@implementation showFullHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self loadData];
    
}
-(void)loadData{
    
    self.books = [Book MR_findAll];
    NSLog(@"we have books-----%@----",self.books);
    [self.tableView reloadData];
}

#pragma mark - tableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    return self.books.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Book *book = self.books[indexPath.row];
    
    showFullHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fullHistoryTableViewCell"];
    [cell setBooksToCell:book];
    
    return cell;
}

@end
