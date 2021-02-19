//
//  UIScrollView+JHKUtil.h
//  JinHuKao
//
//  Created by 杨晓宇 on 2020/10/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (JHKUtil)

// 代理方法scrollViewDidScroll:中调用
- (void)autoHideNavBar;
- (void)srollToTopAndShowNavAnimate:(BOOL)animated;
- (void)srollToTopAndShowNav;

@end

NS_ASSUME_NONNULL_END
