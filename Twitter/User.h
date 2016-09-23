//
//  User.h
//  Twitter
//
//  Created by Santosh Ankola on 9/20/16.
//  Copyright © 2016 myapp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *screenName;
@property(nonatomic, strong) NSString *profileImageUrl;
@property(nonatomic, strong) NSString *tagLine;

- (id) initWithDictionary: (NSDictionary *) dictionary;

@end
