//
//  HamburgerViewController.m
//  Twitter
//
//  Created by Mithun Kumble on 9/22/16.
//  Copyright © 2016 myapp. All rights reserved.
//

#import "HamburgerViewController.h"
#import "MenuViewController.h"

@interface HamburgerViewController ()
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, strong) MenuViewController *menuViewController;

@end

@implementation HamburgerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *  storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.menuViewController = [storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    self.menuViewController.hamburgerViewController = self;
    
    [self.menuView addSubview:self.menuViewController.view];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) setContentViewController:(UIViewController *)contentViewController{
    [self addChildViewController:contentViewController];
    contentViewController.view.frame = self.contentView.bounds;
    [self.contentView addSubview:contentViewController.view];
    [contentViewController didMoveToParentViewController:self];
}

@end
