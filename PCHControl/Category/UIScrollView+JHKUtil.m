//
//  UIScrollView+JHKUtil.m
//  JinHuKao
//
//  Created by 杨晓宇 on 2020/10/16.
//

#import "UIScrollView+JHKUtil.h"
#import "AppDelegate.h"
#import "WMPageController.h"

@implementation UIScrollView (JHKUtil)

- (void)autoHideNavBar
{
     // 方案二：
     
     //scrollView已经有拖拽手势，直接拿到scrollView的拖拽手势
     UIPanGestureRecognizer *pan = self.panGestureRecognizer;
     
    //获取到拖拽的速度 >0 向下拖动 <0 向上拖动
    CGFloat velocity = [pan velocityInView:self].y;
    
    UINavigationController *nav = [(AppDelegate*)[UIApplication sharedApplication].delegate getAppCurrentNavigation];
    if (velocity <- 44) {
        //向上拖动，隐藏导航栏
        if (!nav.navigationBar.hidden) {
            [nav setNavigationBarHidden:YES animated:YES];
            nav.navigationBar.hidden = YES;
        }
    }else if (velocity > 44) {
        //向下拖动，显示导航栏
        if (nav.navigationBar.hidden) {
            [nav setNavigationBarHidden:NO animated:YES];
            nav.navigationBar.hidden = NO;
        }
    }
    
    [self judgeHideNav];
}

- (void)srollToTopAndShowNavAnimate:(BOOL)animated
{
    UINavigationController *nav = [(AppDelegate*)[UIApplication sharedApplication].delegate getAppCurrentNavigation];
    [nav setNavigationBarHidden:NO animated:animated];
    nav.navigationBar.hidden = NO;
    
    [self judgeHideNav];
    
    [self setContentOffset:CGPointMake(0, 0) animated:YES];
}

- (void)srollToTopAndShowNav
{
    [self srollToTopAndShowNavAnimate:YES];
}

- (void)judgeHideNav
{
    UINavigationController *nav = [(AppDelegate*)[UIApplication sharedApplication].delegate getAppCurrentNavigation];
    CGFloat offsetY = 0;
    if (nav.navigationBar.hidden) {
        offsetY  = 20;
    }

    WMPageController *vc = [nav.viewControllers lastObject];
    if ([vc isKindOfClass:[WMPageController class]]) {
        CGRect viewFrame = CGRectMake(0, offsetY, kScreenW, kScreenH - kNavStatuBarHeight);
        if (offsetY == 0) {
            viewFrame.size.height -= kTabBarNavigationHeight;
        }
        if (IS_IPHONE_X) {
            viewFrame.size.height -= kNavStatuBarHeight;
        }

//        vc.viewFrame = viewFrame;
    }
}
@end
