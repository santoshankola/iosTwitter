//
//  Tweet.h
//  Twitter
//
//  Created by Mithun Kumble on 9/20/16.
//  Copyright © 2016 myapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject

@property(nonatomic, strong) NSString *text;
@property(nonatomic, strong) NSDate *createdAt;
@property(nonatomic, strong) User *user;


- (id) initWithDictionary: (NSDictionary *) dictionary;
+ (NSArray *) tweetsWithArray:(NSArray *) array;
@end
