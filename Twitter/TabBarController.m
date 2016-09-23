//
//  TabBarController.m
//  Twitter
//
//  Created by Mithun Kumble on 9/22/16.
//  Copyright © 2016 myapp. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (strong, nonatomic)   UIViewController *greenViewController;
@property (strong, nonatomic)   UIViewController *blueViewController;
@property (strong, nonatomic)   UIViewController *redViewController;
@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"  bundle:nil];
    self.greenViewController = [storyboard instantiateViewControllerWithIdentifier:@"GreenViewController"];
    self.blueViewController = [storyboard instantiateViewControllerWithIdentifier:@"BlueViewController"];
    self.redViewController = [storyboard instantiateViewControllerWithIdentifier:@"RedViewController"];
    
    
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
- (IBAction)onGreenButton:(id)sender {
    [self addChildViewController:self.greenViewController];
    self.greenViewController.view.frame = self.contentView.bounds;
    [self.contentView addSubview:self.greenViewController.view];
    [self.greenViewController didMoveToParentViewController:self];


}

- (IBAction)onBlueButton:(id)sender {
        [self addChildViewController:self.blueViewController];
 self.blueViewController.view.frame = self.contentView.bounds;
    [self.contentView addSubview:self.blueViewController.view];
      [self.blueViewController didMoveToParentViewController:self];

}
- (IBAction)onRedButton:(id)sender {
        [self addChildViewController:self.redViewController];
  self.redViewController.view.frame = self.contentView.bounds;
    [self.contentView addSubview:self.redViewController.view];
      [self.redViewController didMoveToParentViewController:self];

}

@end
