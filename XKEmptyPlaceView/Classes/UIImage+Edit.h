//
//  UIImage+Edit.h
//  Erp4iOS
//	编辑图片的扩展
//  Created by fakepinge on 17/5/22.
//  Copyright © 2017年 成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Edit)

/**
 get圆角图片
 
 @param corners 需要圆角的角
 @param radius 圆角半径
 @return 圆角图
 */
- (UIImage *)roundImageWithCorners:(UIRectCorner)corners radius:(CGFloat)radius;

/**创建纯色图片*/
+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect;

@end
