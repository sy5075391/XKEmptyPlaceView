//
//  UIScrollView+XKEmptyConfig.h
//  PodExampleDemo
//
//  Created by Jamesholy on 2019/1/28.
//  Copyright © 2019 Jamesholy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XKEmptyPlaceView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (XKEmptyConfig)

/**快捷方法 给scrollView*/
- (void)configDefaultEmptyView;

/**获取空数据占位图*/
- (XKEmptyPlaceView *)emptyPlaceView;
/**获取空数据占位图的配置*/
- (XMEmptyViewConfig *)emptyPlaceViewConfig;

@end

NS_ASSUME_NONNULL_END
