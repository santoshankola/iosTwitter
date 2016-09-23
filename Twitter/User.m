//
//  User.m
//  Twitter
//
//  Created by Santosh Ankola on 9/20/16.
//  Copyright © 2016 myapp. All rights reserved.
//

#import "User.h"

@implementation User
- (id) initWithDictionary: (NSDictionary *) dictionary {
    self = [super init];
    
    if(self)
    {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
                self.profileImageUrl = dictionary[@"profile_image_url"];
                self.tagLine = dictionary[@"description"];
    }
    return self;
}
@end
