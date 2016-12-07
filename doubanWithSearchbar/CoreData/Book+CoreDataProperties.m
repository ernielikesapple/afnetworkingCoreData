//
//  Book+CoreDataProperties.m
//  doubanWithSearchbar
//
//  Created by ernie.cheng on 12/6/16.
//  Copyright © 2016 Robin.Pan. All rights reserved.
//

#import "Book+CoreDataProperties.h"

@implementation Book (CoreDataProperties)

+ (NSFetchRequest<Book *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Book"];
}

@dynamic bookTitle;
@dynamic bookPublisher;
@dynamic bookPages;
@dynamic bookImageURL;
@dynamic bookSummary;

@end
