//
//  BaseNavigationController.m
//  threeTiertTable
//
//  Created by kim on 12/03/2018.
//  Copyright © 2018 kim. All rights reserved.
//

#import "BaseNavigationController.h"
#import "MainVC.h"
@interface BaseNavigationController()<UIGestureRecognizerDelegate>



@end

@implementation BaseNavigationController

- (void)dealloc{
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    //设置标题颜色字体
    self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                              [UIFont boldSystemFontOfSize:18],
                                              NSFontAttributeName,
                                              [UIColor whiteColor],
                                              NSForegroundColorAttributeName,nil];
    //返回键的颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.barTintColor = [UIColor blackColor];//DEFAULTCOLOR;
    
    __weak typeof (self) weakSelf = self;
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
}
- (UIStatusBarStyle )preferredStatusBarStyle{
    UIViewController *vc = [[MainVC alloc]init];
    return [vc preferredStatusBarStyle];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.navigationController.viewControllers.count > 1) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }else{
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [self.navigationBar setTranslucent:NO];
    if (self.childViewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"<" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
    [super pushViewController:viewController animated:animated];
}
- (void)back{
    [self popViewControllerAnimated:YES];
}
@end
