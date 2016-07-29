//
//  ContainerViewController.h
//  侧滑菜单
//
//  Created by Mokyz on 16/7/28.
//  Copyright © 2016年 Moky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContainerViewController : UIViewController

@property (nonatomic, assign) BOOL isShow;

- (void)hideMenu;
- (void)toggleMenu;

@end
