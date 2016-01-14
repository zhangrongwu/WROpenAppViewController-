//
//  WRAppTaBarViewController.m
//  WROpenAppViewController(一)
//
//  Created by zhang_rongwu on 16/1/13.
//  Copyright © 2016年 zhang_rongwu. All rights reserved.
//

#import "WRAppTaBarViewController.h"

@interface WRAppTaBarViewController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
@property(nonatomic, strong) NSArray *viewCtrs;


@end

@implementation WRAppTaBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initWRViewController];
    
    NSString *url = @"qcrl://qcrlapp.com/push?text=饿了么与你一起热炼&url=http%3A%2F%2Fmp&id=2&class=WRMeViewController&subClass=WRMe_2ViewController";
    NSURL *openURL = [NSURL URLWithString:url];
    [self openViewControllerWithURL:openURL];
}

- (void)initWRViewController {
    self.meVc = [[WRMeViewController alloc]init];
    self.homeVc = [[WRHomeViewController alloc] init];
    NSArray *viewControllers = @[self.meVc, self.homeVc];
    self.viewCtrs = viewControllers;
    NSMutableArray *navigationCtrs = [NSMutableArray arrayWithCapacity:viewControllers.count];
    for (UIViewController *viewController in viewControllers) {
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
        //右拉返回功能(自定义了leftBarButtonItem后功能会消失,加上这个就ok了)
        nav.interactivePopGestureRecognizer.delegate = self;
        nav.delegate = self;
        [navigationCtrs addObject:nav];
    }
    self.viewControllers = navigationCtrs;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** 外部启动*/
- (void)openViewControllerWithURL:(NSURL *)pushUrl {
    // 外部启动一般是以urlSchemes形式启动app，所以处理得处理url例如：（qcrl://qcrlapp.com/push?text=饿了么与你一起热炼&url=http%3A%2F%2Fmp）
//    NSString *scheme = pushUrl.scheme;
//    NSString *path =pushUrl.path;
//    NSString *query = pushUrl.query;
//    
//    NSMutableDictionary *queryStrings = [NSMutableDictionary dictionary];
//    for (NSString *qs in [query componentsSeparatedByString:@"&"]) {
//        NSString *key = [[qs componentsSeparatedByString:@"="] objectAtIndex:0];
//        NSString *value = [[qs componentsSeparatedByString:@"="] objectAtIndex:1];
//        value = [value stringByReplacingOccurrencesOfString:@"+" withString:@" "];
//        value = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        queryStrings[key] = value;
//    }
//    NSString *url = @"qcrl://qcrlapp.com/push?text=饿了么与你一起热炼&url=http%3A%2F%2Fmp&id=2&class=WRMeViewController&subClass=WRMe_2ViewController";
//    NSDictionary *dic = @{@"path":path,
//                          @"id":queryStrings[@"id"],
//                          @"class":queryStrings[@"class"],
//                          @"subClass":queryStrings[@"subClass"]};
    

    /**
     *
     *
     *
     * 以上代码为外部启动或者推送传入的字符串（url）,需要对url进行处理。
     *
     *
     *
     *
     *
     *
     *path: url地址
     *id: 进入页面的可能必要的参数
     *class: 一级页面对应的字段
     *subClass: 二级页面对应字段
     *
     **/
    NSDictionary *dic = @{@"path":@"qcrlapp.com/push",
                          @"id":@"1",
                          @"class":@"WRHomeViewController",
                          @"subClass":@"WRHome_1ViewController"};
    for (int i = 0; i < self.viewCtrs.count ; i++) {
        WRBaseViewController *vc = [self.viewCtrs objectAtIndex:i];
        NSLog(@"%@", vc);
        if ([vc push:dic]) {
          UIViewController *vc_1 = [[WRViewControllerManager sharedInstance] compareWithTabBarIndex:i pushInfo:dic];
            self.selectedIndex = i;
            [vc.navigationController pushViewController:vc_1 animated:YES];
        }
    }
}

@end
