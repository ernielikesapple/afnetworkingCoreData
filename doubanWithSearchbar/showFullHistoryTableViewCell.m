//
//  showFullHistoryTableViewCell.m
//  doubanWithSearchbar
//
//  Created by ernie.cheng on 12/6/16.
//  Copyright © 2016 Robin.Pan. All rights reserved.
//

#import "showFullHistoryTableViewCell.h"


@interface showFullHistoryTableViewCell()

@property (strong, nonatomic) IBOutlet UIImageView *bookImageFrame;

@property (strong, nonatomic) IBOutlet UILabel *bookTitleLabel;

@property (strong, nonatomic) IBOutlet UILabel *bookPublisherLabel;
@property (strong, nonatomic) IBOutlet UILabel *bookPagesLabel;


@end

@implementation showFullHistoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- ( void ) setBooksToCell : ( Book* ) mybook
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
