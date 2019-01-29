//
//  UIScrollView+XKEmptyConfig.m
//  PodExampleDemo
//
//  Created by Jamesholy on 2019/1/28.
//  Copyright © 2019 Jamesholy. All rights reserved.
//

#import "UIScrollView+XKEmptyConfig.h"
#import "XKEmptyPlaceView.h"
#import <objc/runtime.h>

@interface UIScrollView()

/**<##>*/
@property(nonatomic, strong) XKEmptyPlaceView *innerEmptyView;

@end

@implementation UIScrollView (XKEmptyConfig)

- (void)configDefaultEmptyView {
    self.innerEmptyView = [XKEmptyPlaceView configScrollView:self config:nil];
}


- (XMEmptyViewConfig *)emptyPlaceViewConfig {
    return self.innerEmptyView.config;
}

- (XKEmptyPlaceView *)emptyPlaceView {
    return self.innerEmptyView;
}

static const char *_innerEmptyView = "_innerEmptyView";
- (void)setInnerEmptyView:(XKEmptyPlaceView *)innerEmptyView {
     objc_setAssociatedObject(self, _innerEmptyView, innerEmptyView, OBJC_ASSOCIATION_RETAIN);
}

- (XKEmptyPlaceView *)innerEmptyView {
    return objc_getAssociatedObject(self, _innerEmptyView);
}

@end
