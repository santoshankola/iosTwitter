//
//  MenuViewController.m
//  Twitter
//
//  Created by Mithun Kumble on 9/22/16.
//  Copyright © 2016 myapp. All rights reserved.
//

#import "MenuViewController.h"


@interface MenuViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic)   UIViewController *greenViewController;
@property (strong, nonatomic)   UIViewController *blueViewController;
@property (strong, nonatomic)   UIViewController *redViewController;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"  bundle:nil];
    self.greenViewController = [storyboard instantiateViewControllerWithIdentifier:@"GreenViewController"];
    self.blueViewController = [storyboard instantiateViewControllerWithIdentifier:@"BlueViewController"];
    self.redViewController = [storyboard instantiateViewControllerWithIdentifier:@"RedViewController"];
    
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableView * cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
    
    if(indexPath.row == 0) {
        cell.backgroundColor = [UIColor greenColor];
        
    }
    else if(indexPath.row == 1) {
        cell.backgroundColor = [UIColor blueColor];
        
    }
    else if(indexPath.row == 2) {
        cell.backgroundColor = [UIColor redColor];
        
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.row == 0) {
        [self.hamburgerViewController setContentViewController:self.greenViewController];
        
    }
    else if(indexPath.row == 1) {
        [self.hamburgerViewController setContentViewController:self.blueViewController];
        
    }
    else if(indexPath.row == 2) {
        [self.hamburgerViewController setContentViewController:self.redViewController];
        
    }
}
@end
