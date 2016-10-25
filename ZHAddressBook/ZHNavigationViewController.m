//
//  ZHNavigationViewController.m
//  ZHAddressBook
//
//  Created by aimoke on 16/10/24.
//  Copyright © 2016年 zhuo. All rights reserved.
//

#import "ZHNavigationViewController.h"

@interface ZHNavigationViewController ()

@end

@implementation ZHNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    self.navigationBar.translucent = YES;
    
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

@end
