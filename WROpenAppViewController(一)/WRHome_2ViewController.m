//
//  WRHome_2ViewController.m
//  WROpenAppViewController(一)
//
//  Created by zhang_rongwu on 16/1/13.
//  Copyright © 2016年 zhang_rongwu. All rights reserved.
//

#import "WRHome_2ViewController.h"

@interface WRHome_2ViewController ()

@end

@implementation WRHome_2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = [NSString stringWithFormat:@"%s", __func__];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)push:(NSDictionary *)param {
    [super push:param];
    if ([param[@"subClass"] isEqualToString:@"WRHome_2ViewController"]) {
        return YES;
    }
    return NO;
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
