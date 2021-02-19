//
//  UIView+JHKUtil.m
//  JinHuKao
//
//  Created by 杨晓宇 on 2020/10/16.
//

#import "UIView+JHKUtil.h"
#import "AppDelegate.h"
#import <FLAnimatedImage.h>

@implementation UIView (JHKUtil)
- (UIImage *)convertViewToImage
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return screenshot;
}

- (void)clearSubviews
{
    NSArray *subviews = self.subviews;
    for (UIView *subview in subviews) {
        [subview removeFromSuperview];
    }
}

- (UIView*)subViewOfClassName:(NSString*)className
{
    for (UIView* subView in self.subviews) {
        if ([NSStringFromClass(subView.class) isEqualToString:className]) {
            return subView;
        }
        
        UIView* resultFound = [subView subViewOfClassName:className];
        if (resultFound) {
            return resultFound;
        }
    }
    return nil;
}

- (BOOL)isInScreen
{
    UIWindow *window = jhkAppDelegate.window;
    CGRect cardRect = [self convertRect:self.bounds toView:window];
    
    CGRect interRect =  CGRectIntersection(window.frame, cardRect);
    
    if (CGRectIsEmpty(interRect) || CGRectIsNull(interRect)) {
        return false;
    }
    return true;
}

- (void)flip
{
    CGFloat duration = 1.0;
    
    //获取当前画图的设备上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //开始准备动画
    [UIView beginAnimations:nil context:context];
    
    //设置动画曲线
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    //设置动画持续时间
    [UIView setAnimationDuration:duration];
    
    //因为没给viewController类添加成员变量，所以用下面方法得到viewDidLoad添加的子视图
    UIView *parentView = self;
    
    //设置动画效果
    // [UIView setAnimationTransition: UIViewAnimationTransitionCurlDown forView:parentView cache:YES];  //从上向下
    // [UIView setAnimationTransition: UIViewAnimationTransitionCurlUp forView:parentView cache:YES];   //从下向上
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView:parentView cache:YES];  //从左向右
    // [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight forView:parentView cache:YES];//从右向左
    
    //设置动画委托
    [UIView setAnimationDelegate:self];
    //当动画执行结束，执行animationFinished方法
    if ([self respondsToSelector:@selector(animationFinished:)]) {
        [UIView setAnimationDidStopSelector:@selector(animationFinished:)];
    }
    
    //提交动画
    [UIView commitAnimations];
}

- (void)animationFinished:(id)sender{}

- (void)shakeToShow
{
    UIView *aView = self;
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}

+ (UIView*)LiveStateGifImage:(NSString*)gifName title:(NSString*)title viewSize:(CGSize)size
{
    if ([NSString isEmptyOrNull:gifName]) {
        return [[UIView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    }
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    view.backgroundColor = nC10_FFFFFF_white;
    
    UIColor *titleColor = nC4_333333;

    CGFloat x = 12;
    NSString *string = title;
    UIFont *font = kFont(nF4_14);
    
    FLAnimatedImageView *coverGifView = [[FLAnimatedImageView alloc]initWithImage:[UIImage imageNamed:gifName]];
    coverGifView.frame = CGRectMake(6, 8, 8, 10);
    [view addSubview:coverGifView];
    
    x = CGRectGetMaxX(coverGifView.frame)+3;
    
    UILabel *bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(x, 2, 42, 20)];
    bottomLabel.font = font;
    bottomLabel.textAlignment = NSTextAlignmentLeft;
    bottomLabel.textColor = titleColor;
    bottomLabel.text = string;
    [view addSubview:bottomLabel];
    
    return view;
}
@end
