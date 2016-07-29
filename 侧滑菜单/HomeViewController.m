//
//  HomeViewController.m
//  侧滑菜单
//
//  Created by Mokyz on 16/7/28.
//  Copyright © 2016年 Moky. All rights reserved.
//

#import "HomeViewController.h"
#import "ContainerViewController.h"

@interface HomeViewController ()
{
    BOOL _isShwoMenu;
}

@end

@implementation HomeViewController

- (IBAction)menuAction:(UIBarButtonItem *)sender
{
    [self.containerVC toggleMenu];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.containerVC hideMenu];
}


- (ContainerViewController *)containerVC
{
    return (ContainerViewController *)self.tabBarController.parentViewController;
}
@end
