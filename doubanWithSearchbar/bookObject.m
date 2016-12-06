//
//  bookObject.m
//  doubanWithSearchbar
//
//  Created by Robin.Pan on 06/12/2016.
//  Copyright © 2016 Robin.Pan. All rights reserved.
//

#import "bookObject.h"

@implementation bookObject

- ( void ) addAttributes : ( NSObject * ) book
{
	_bookTitle = [ book valueForKey:@"title" ] ;
	_bookPages = [ book valueForKey:@"pages" ] ;
	_bookPublisher = [ book valueForKey:@"publisher" ] ;
	_bookImageURL = [ book valueForKey:@"image" ] ;
	_bookSummary = [ book valueForKey:@"summary" ] ;
}

@end
