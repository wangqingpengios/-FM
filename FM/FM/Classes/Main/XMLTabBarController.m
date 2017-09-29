//
//  XMLTabBarController.m
//  FM
//
//  Created by home on 2017/8/16.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "XMLTabBarController.h"

#import "XMLFindViewController.h"

@interface XMLTabBarController ()

@end

@implementation XMLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray * vcs = [NSMutableArray array];
    //发现控制比较特殊 没有抽取出来
    UINavigationController *findNav = [XMLFindViewController findViewController];
    findNav.tabBarItem.title = @"";
    findNav.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    [findNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
     findNav.tabBarItem.image = [UIImage imageNamed:@"tabbar_find_n"];
    findNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_find_h"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    findNav.automaticallyAdjustsScrollViewInsets = NO;
    [vcs addObject:findNav];
    
    //定制听
    [vcs addObject:[self childViewControllerWithClassName:[UIViewController class] vctitle:@"" tabImageName:@"tabbar_sound_n" tabSelectImageName:@"tabbar_sound_h" withTabTitle:@""]];
    
    //下载听
    [vcs addObject:[self childViewControllerWithClassName:[UIViewController class] vctitle:@"" tabImageName:@"tabbar_download_n" tabSelectImageName:@"tabbar_download_h" withTabTitle:@""]];
    
    //我的
    [vcs addObject:[self childViewControllerWithClassName:[UIViewController class] vctitle:@"" tabImageName:@"tabbar_me_n" tabSelectImageName:@"tabbar_me_h" withTabTitle:@""]];
    
    self.viewControllers = vcs.copy;
    
    //用这个有问题！！！
//    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    
    
}



#pragma mark - 返回控制器的方法
- (UIViewController *)childViewControllerWithClassName:(Class )cla vctitle:(NSString *)title tabImageName:(NSString *)tabImage tabSelectImageName:(NSString *)tabSelectImage withTabTitle:(NSString *)tabTitle {
    NSAssert([cla isSubclassOfClass:[UIViewController class]], @"cla类型必须要是UIViewController类型,error 回来看这里");
    UIViewController * vc = [[cla alloc]init];
    vc.title = title;
    vc.tabBarItem.title = tabTitle;
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
    vc.tabBarItem.image = [UIImage imageNamed:tabImage];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:tabSelectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //创建导航控制器
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];

    return nav
    ;
}

@end
