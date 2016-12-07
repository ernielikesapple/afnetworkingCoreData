//
//  Book+CoreDataProperties.h
//  doubanWithSearchbar
//
//  Created by ernie.cheng on 12/6/16.
//  Copyright © 2016 Robin.Pan. All rights reserved.
//

#import "bookObject.h"


NS_ASSUME_NONNULL_BEGIN

@interface Book (CoreDataProperties)

+ (NSFetchRequest<Book *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *bookTitle;
@property (nullable, nonatomic, copy) NSString *bookPublisher;
@property (nullable, nonatomic, copy) NSString *bookPages;
@property (nullable, nonatomic, copy) NSString *bookImageURL;
@property (nullable, nonatomic, copy) NSString *bookSummary;

@end

NS_ASSUME_NONNULL_END
