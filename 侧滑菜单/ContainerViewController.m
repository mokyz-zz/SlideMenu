//
//  ContainerViewController.m
//  侧滑菜单
//
//  Created by Mokyz on 16/7/28.
//  Copyright © 2016年 Moky. All rights reserved.
//

#import "ContainerViewController.h"
#import "MenuViewController.h"

@interface ContainerViewController ()<UIScrollViewDelegate>
{
    CGFloat _progress;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIView *homeView;
@end

@implementation ContainerViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self hideShowMenuAnimated:NO];
    
    self.menuView.layer.anchorPoint = CGPointMake(1.0, 0.5);
}

- (void)hideShowMenuAnimated:(BOOL)animate
{
    CGFloat menuOffX = CGRectGetWidth(self.menuView.bounds);
    [self.scrollView setContentOffset:(self.scrollView.contentOffset.x != 0 ? CGPointZero : CGPointMake(menuOffX, 0)) animated:YES];
}

- (void)hideMenu
{
    if (self.isShow) {
        [self hideShowMenuAnimated:YES];
    }
}

- (void)toggleMenu
{
    [self hideShowMenuAnimated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat multipier = 1 / CGRectGetWidth(self.menuView.bounds);
    _progress = 1 - (scrollView.contentOffset.x) * multipier;
    
    self.menuView.layer.transform = [self menuTransformForPercent:_progress];
}

- (CATransform3D)menuTransformForPercent:(CGFloat)percent
{
    CATransform3D identity = CATransform3DIdentity;
    identity.m34 = -1/1000.f;
    CGFloat remainingPercent = 1.f - percent;
    CGFloat angle = remainingPercent * -M_PI_2;
    CATransform3D rotation = CATransform3DRotate(identity, angle, 0, 1.f, 0);
    CATransform3D translation = CATransform3DMakeTranslation(CGRectGetWidth(self.menuView.bounds)/2, 0, 0);
    
    return CATransform3DConcat(rotation, translation);
}

- (BOOL)isShow
{
    if (self.scrollView.contentOffset.x == 0) {
        return YES;
    }
    else {
        return NO;
    }
}

@end
