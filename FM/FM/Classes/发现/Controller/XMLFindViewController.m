//
//  XMLFindViewController.m
//  FM
//
//  Created by home on 2017/8/16.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "XMLFindViewController.h"
//推荐
#import "XMLHomePageViewController.h"

@interface XMLFindViewController ()


@end


@implementation XMLFindViewController

+ (UINavigationController *)findViewController {
    static UINavigationController *nav = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        XMLFindViewController * findVC = [[XMLFindViewController alloc]initWithViewControllerClasses:[self viewControllerClass] andTheirTitles:@[@"推荐",@"分类",@"直播",@"榜单",@"主播"]];
        findVC.menuViewStyle = WMMenuViewStyleLine;
        findVC.progressColor = [UIColor redColor];
        findVC.progressHeight = 1.0f;
        findVC.titleSizeNormal = 13;
        findVC.titleSizeSelected = 13;
        findVC.progressWidth = 30;
        findVC.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
        nav = [[UINavigationController alloc] initWithRootViewController:findVC];
    });
    return nav;
}

+ (NSArray *)viewControllerClass {
    
    return @[[XMLHomePageViewController class],[UIViewController class],[UIViewController class],[UIViewController class],[UIViewController class]];
}

-(void)viewDidLoad {

    [super viewDidLoad];
    
    NSLog(@"%@",NSStringFromCGPoint(self.scrollView.contentOffset));
}

@end
