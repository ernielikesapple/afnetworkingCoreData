//
//  bookObject.h
//  doubanWithSearchbar
//
//  Created by Robin.Pan on 06/12/2016.
//  Copyright © 2016 Robin.Pan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface bookObject : NSObject

@property ( nonatomic, strong ) NSString *bookTitle ;
@property ( nonatomic, strong ) NSString *bookPublisher ;
@property ( nonatomic, strong ) NSString *bookPages ;
@property ( nonatomic, strong ) NSString *bookImageURL ;
@property ( nonatomic, strong ) NSString *bookSummary ;

- ( void ) addAttributes : ( NSObject * ) book ;

@end
