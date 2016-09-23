//
//  TwitterClient.h
//  Twitter
//
//  Created by Santosh Ankola on 9/20/16.
//  Copyright © 2016 myapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDBOAuth1SessionManager.h"
#import "User.h"

@interface TwitterClient : BDBOAuth1SessionManager

+ (TwitterClient *) sharedInstance;

- (void) loginWIthCompletion:(void (^) (User *user, NSError * error)) completion;
-(void) openURL:(NSURL *) url;
@end
