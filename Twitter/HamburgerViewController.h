//B
//  HamburgerViewController.h
//  Twitter
//
//  Created by Santosh Ankola on 9/22/16.
//  Copyright © 2016 myapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HamburgerViewController : UIViewController

- (void) setContentViewController:(UIViewController *) contentViewController;

- (void) openMenu;
- (void) closeMenu;
@end
