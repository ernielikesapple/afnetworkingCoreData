//
//  SearchTableViewCell.h
//  doubanWithSearchbar
//
//  Created by Robin.Pan on 06/12/2016.
//  Copyright © 2016 Robin.Pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bookObject.h"

@interface SearchTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bookImageFrame;
@property (weak, nonatomic) IBOutlet UILabel *bookTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookPublisherLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookPagesLabel;

- ( void ) setBooksToCell : ( Book * ) mybook ;

@end
