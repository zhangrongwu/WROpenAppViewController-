//
//  WRViewControllerManager.m
//  WROpenAppViewController(一)
//
//  Created by zhang_rongwu on 16/1/13.
//  Copyright © 2016年 zhang_rongwu. All rights reserved.
//

#import "WRViewControllerManager.h"
@interface WRViewControllerManager()
@property (nonatomic, strong)NSArray *WR_TabViewController_List;
// 一组viewController
@property (nonatomic, strong)NSArray *WR_ViewController_List_1;

@property (nonatomic, strong)NSArray *WR_ViewController_List_2;

@end

@implementation WRViewControllerManager
+(instancetype) sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(UIViewController *) compareWithTabBarIndex:(NSInteger)index pushInfo:(NSDictionary *)info {
    for (Class class in [self.WR_TabViewController_List objectAtIndex:index]) {
        NSLog(@"%@", class);
        WRBaseViewController *vc = [[class alloc] init];
        if ([vc push:info]) {
            NSLog(@"VC%@", vc);
            return vc;
        }
    }
    return nil;
}

/** 被维护的viewcontrollser数组*/
-(NSArray *)WR_TabViewController_List {
    if (!_WR_TabViewController_List) {
        _WR_TabViewController_List = @[self.WR_ViewController_List_1, self.WR_ViewController_List_2];
    }
    return _WR_TabViewController_List;
}

#warning 不能把组长(tabbar上的控制器)加入二级数组维护。
-(NSArray *)WR_ViewController_List_1 {
    if (!_WR_ViewController_List_1) {
        _WR_ViewController_List_1 = @[[WRMe_1ViewController class], [WRMe_2ViewController class]];
    }
    return _WR_ViewController_List_1;
}

-(NSArray *)WR_ViewController_List_2 {
    if (!_WR_ViewController_List_2) {
        _WR_ViewController_List_2 = @[[WRHome_1ViewController class], [WRHome_2ViewController class]];
    }
    return _WR_ViewController_List_2;
}

@end
