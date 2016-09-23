//
//  TwitterClient.m
//  Twitter
//
//  Created by Mithun Kumble on 9/20/16.
//  Copyright © 2016 myapp. All rights reserved.
//

#import "TwitterClient.h"
NSString *const kTwitterConsumerKey = @"bxzEUR6RRiOHrx3L6XqAX7p0r";
NSString *const kTwitterConsumerSecret = @"tiPbMHbZCK7jNhw1OeIZ2MMMxS62ZBVdUnkfmeZHRiq6460Uln";
NSString *const kTwitterBaseUrl = @"https://api.twitter.com";

@interface  TwitterClient()

@property(nonatomic, strong) void (^loginCompletion)(User* user, NSError * error);

@end
@implementation TwitterClient

+ (TwitterClient *) sharedInstance {
    static TwitterClient *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(instance == nil) {
            instance = [[TwitterClient alloc] initWithBaseURL:[NSURL URLWithString:kTwitterBaseUrl] consumerKey:kTwitterConsumerKey consumerSecret: kTwitterConsumerSecret];
            
        }
    });
      return instance;
}

- (void) loginWIthCompletion:(void (^) (User *user, NSError * error)) completion
{
    self.loginCompletion = completion;
    
    [self.requestSerializer removeAccessToken];
    [self fetchRequestTokenWithPath:@"oauth/request_token" method:@"GET" callbackURL:[NSURL URLWithString:@"cptwitterdemo://oauth"] scope:nil success:^(BDBOAuth1Credential *requestToken) {
        NSLog(@"Got the request token");
        NSURL *authURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.twitter.com/oauth/authorize?oauth_token=%@", requestToken.token]];
        [[UIApplication sharedApplication] openURL:authURL];
        
    } failure:^(NSError *error) {
        NSLog(@"Failed to get the request token");
        self.loginCompletion(nil, error);
    }];
    
}

-(void) openURL:(NSURL *)url
{
    [self fetchAccessTokenWithPath:@"oauth/access_token" method:@"POST" requestToken:[BDBOAuth1Credential credentialWithQueryString:url.query  ] success:^(BDBOAuth1Credential *accessToken) {
        
        NSLog(@"got the access token!");
        [self.requestSerializer saveAccessToken: accessToken];
        [self GET:@"1.1/account/verify_credentials.json" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"current user: %@", responseObject);
            User * user = [[User alloc] initWithDictionary:responseObject];
            NSLog(@"current user: %@", user.name);
            self.loginCompletion(user, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"Failed getting current user");
        }];
        
      /*  [[TwitterClient sharedInstance] GET:@"1.1/statuses/home_timeline.json" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //NSLog(@"tweets: %@", responseObject);
            NSArray * tweets = [Tweet tweetsWithArray:responseObject];
            for(Tweet * tweet in tweets) {
                NSLog(@"Tweet: %@, created %@", tweet.text, tweet.createdAt);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"Error getting tweets");
        }]; 
       */
    } failure:^(NSError *error) {
        NSLog(@"Failed to get access token");
        self.loginCompletion(nil, error);

    }];

}

@end
