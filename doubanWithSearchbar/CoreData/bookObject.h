//
//  Book+CoreDataClass.h
//  doubanWithSearchbar
//
//  Created by ernie.cheng on 12/6/16.
//  Copyright © 2016 Robin.Pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSManagedObject

 -( void ) addAttributes : ( NSObject * ) book ;
@end

NS_ASSUME_NONNULL_END

#import "Book+CoreDataProperties.h"
