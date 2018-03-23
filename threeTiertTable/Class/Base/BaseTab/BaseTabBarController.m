//
//  BaseTabBarController.m
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"

#import "MainVC.h"
@interface BaseTabBarController()


@end

@implementation BaseTabBarController


- (void)dealloc{
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setUpTabBarController];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)setUpTabBarController{
    
    //这里写需要添加到tabbar的字容器
    MainVC * mvc = [[MainVC alloc]init];
    [self addChildVC:mvc title:@"首页" withDefaultImgName:@"" withSelectedImgName:@""];

    self.tabBar.translucent = NO;//是否透明
    
    self.tabBar.barTintColor = [UIColor whiteColor];//背景色
    
    self.tabBar.tintColor = [UIColor blackColor];//字体颜色
}


- (void)addChildVC:(UIViewController *)childViewController title:(NSString *)title withDefaultImgName:(NSString *)defaultImg withSelectedImgName:(NSString *)selectedImg{
    childViewController.title = title;
    [childViewController.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                            [UIFont systemFontOfSize:10],NSFontAttributeName, nil] forState:UIControlStateNormal];
    childViewController.tabBarItem.image = [[UIImage imageNamed:defaultImg]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    BaseNavigationController *nav=[[BaseNavigationController alloc]initWithRootViewController:childViewController];
    [self addChildViewController:nav];
    
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
