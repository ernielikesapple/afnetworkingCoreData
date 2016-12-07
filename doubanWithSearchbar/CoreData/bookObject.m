//
//  Book+CoreDataClass.m
//  doubanWithSearchbar
//
//  Created by ernie.cheng on 12/6/16.
//  Copyright © 2016 Robin.Pan. All rights reserved.
//

#import "bookObject.h"

@implementation Book

- ( void ) addAttributes : ( NSObject * ) book
{
    self.bookTitle = [ book valueForKey:@"title" ] ;
    self.bookPages = [ book valueForKey:@"pages" ] ;
    self.bookPublisher = [ book valueForKey:@"publisher" ] ;
    self.bookImageURL = [ book valueForKey:@"image" ] ;
    self.bookSummary = [ book valueForKey:@"summary" ] ;
}
@end
