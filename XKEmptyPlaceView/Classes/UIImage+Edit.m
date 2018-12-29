//
//  UIImage+Edit.m
//  Erp4iOS
//	编辑图片的扩展
//  Created by fakepinge on 17/5/22.
//  Copyright © 2017年 成都. All rights reserved.
//

#import "UIImage+Edit.h"
#import <CoreImage/CoreImage.h>

void ProviderReleaseData(void *info, const void *data, size_t size) {
	free((void *)data);
}

@implementation UIImage (Edit)




- (UIImage *)roundImageWithCorners:(UIRectCorner)corners radius:(CGFloat)radius {
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    
    CGContextAddPath(context, maskPath.CGPath);
    CGContextClip(context);
    
    [self drawInRect:rect];
    
    UIImage *roundImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return roundImage;
}


#pragma mark - 创建纯色图片
+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


@end
