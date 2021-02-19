//
//  UIBarButtonItem+Extension.m
//  demo
//
//  Created by Clark on 2017/10/24.
//  Copyright © 2017年 Clark. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import <UIView+MJExtension.h>

@implementation UIBarButtonItem (Extension)


+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action{
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]] forState:UIControlStateHighlighted];
    button.size = button.currentImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action{
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16.f];
    [button setTitleColor:UIColorFromRGB(0x0099ff) forState:UIControlStateNormal];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0);
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title titleColor:(UIColor *) color  target:(id)target action:(SEL)action{
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16.f];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0);
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title Target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    UIFont *font = kFont(15.0);
    btn.titleLabel.font = font;
    
//    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:titleDefaultColor forState:UIControlStateNormal];
    // 设置尺寸
    CGSize size = [btn.titleLabel.text sizeWithFont:font maxW:80];
    btn.mj_size = size;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [btn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
//    btn.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    // 设置尺寸
//    btn.mj_size = btn.currentBackgroundImage.size;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


@end
