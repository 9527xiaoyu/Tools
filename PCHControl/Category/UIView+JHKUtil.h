//
//  UIView+JHKUtil.h
//  JinHuKao
//
//  Created by 杨晓宇 on 2020/10/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JHKUtil)
/**视图转换成图像*/
- (UIImage *)convertViewToImage;

- (void)clearSubviews;

- (UIView*)subViewOfClassName:(NSString*)className;

- (BOOL)isInScreen;

- (void)flip;

- (void)shakeToShow;

+ (UIView*)LiveStateGifImage:(NSString*)gifName title:(NSString*)title viewSize:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
