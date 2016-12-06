//
//  SearchTableViewCell.m
//  doubanWithSearchbar
//
//  Created by Robin.Pan on 06/12/2016.
//  Copyright © 2016 Robin.Pan. All rights reserved.
//

#import "SearchTableViewCell.h"

@implementation SearchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- ( void ) setBooksToCell : ( bookObject * ) mybook
{
	//------------ set values ------------------
	_bookTitleLabel.text      = mybook.bookTitle ;
	_bookPublisherLabel.text  = mybook.bookPublisher ;
	_bookPagesLabel.text = mybook.bookPages ;
	//-------- set picture -----------
	NSString *url = mybook.bookImageURL ;
	NSData * data = [ NSData dataWithContentsOfURL:[NSURL URLWithString:url ] ];
	_bookImageFrame.image = [ UIImage imageWithData:data ];
}


@end
