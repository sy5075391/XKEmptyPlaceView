/*******************************************************************************
 # File        : XKEmptyPlaceView.h
 # Project     : 
 # Author      : Jamesholy
 # Created     : 2018/8/23
 # Corporation : code
 # Description :
 /
 -------------------------------------------------------------------------------
 # Date        : /
 # Author      : /
 # Notes       :
 /
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "UIScrollView+XKEmptyDataSet.h"

@class XMEmptyViewConfig;

@interface XKEmptyPlaceView : NSObject

/**配置器*/
@property(nonatomic, strong, readonly) XMEmptyViewConfig *config;
/**
 配置无数据视图
 
 @param scrollView 需要显示在哪个scrollView上
 @param config 配置器 配置相关界面显示效果 传nil会生成默认配置
 @return 视图控制类
 */
+ (instancetype)configScrollView:(nonnull UIScrollView *)scrollView config:(nullable XMEmptyViewConfig *)config;

/**重置默认config*/
- (void)resetConfig;

#pragma mark - 传入参数是在方法内部也是改变config的值 需要动态改变更多配置可在show之前设置config属性
/**不带按钮的占位图*/
- (void)showWithImgName:(NSString *)imgName title:(NSString *)title des:(NSString *)des tapClick:(void(^)(void))tap;
/**下方带按钮的 btnImg 可是image or 图片名称*/
- (void)showWithImgName:(NSString *)imgName title:(NSString *)title des:(NSString *)des btnText:(NSString *)btnText btnImg:(id)btnImg tapClick:(void(^)(void))tap;

- (void)hide;

@end


@interface XMEmptyViewConfig : NSObject


/**顶部图片*/
@property(nonatomic, strong) UIImage *image;
/**顶部图片是否是否自定义尺寸 defualt no 使用image大小*/
@property(nonatomic, assign) BOOL useSpecialImageSize;
/**顶部图片自定义尺寸*/
@property(nonatomic, assign) CGSize specialImageSize;
/**视图是否可点击 default：YES*/
@property(nonatomic, assign) BOOL viewAllowTap;

/**标题颜色 default：RGBGRAY(51)*/
@property(nonatomic, strong) UIColor *titleColor;
/**标题字体 default：16.0*/
@property(nonatomic, strong) UIFont *titleFont;

/**描述颜色 default：0x777777*/
@property(nonatomic, strong) UIColor *descriptionColor;
/**描述字体 default：14.0*/
@property(nonatomic, strong) UIFont *descriptionFont;

/**按钮文字颜色 0x4A90FA*/
@property(nonatomic, strong) UIColor *btnColor;
/**按钮文字字体 default：14.0*/
@property(nonatomic, strong) UIFont *btnFont;

/**按钮背景颜色设置 图片名称字符串string/image/UIColor*/
@property(nonatomic, strong) id btnBackImg;
/**按钮图片裁剪保护 defaut UIEdgeInsetsMake(11.0, 11.0, 11.0, 11.0)*/
@property(nonatomic) UIEdgeInsets  capInsets;
/**按钮左右margin default 15*/
@property(nonatomic) CGFloat  btnMargin;

/**背景颜色 default：F6F6F6F6*/
@property(nonatomic, strong) UIColor *backgroundColor;

/**是否可滑动 default: NO*/
@property(nonatomic, assign) BOOL allowScroll;

/**verticalOffset  topOffset  topMutiOffset 只能有一个生效  默认是居中verticalOffset = 0*/
/**以居中的形式 垂直方向偏移量 */
@property(nonatomic, assign) CGFloat verticalOffset;
/**距离顶部偏移量 设0无效 */
@property(nonatomic, assign) CGFloat topOffset;
/**距离顶部占父视图的比例 0~1 设0无效 exp：0.2 代表顶部距离scrollView顶部，距离为scrollView的高度的1/5  */
@property(nonatomic, assign) CGFloat topMutiOffset;
/**视图高度间隔 defualt: 8*/
@property(nonatomic, assign) CGFloat spaceHeight; // 统一设下面的👇

@property(nonatomic, assign) CGFloat spaceImgBtmHeight; // 图片底部间隔
@property(nonatomic, assign) CGFloat spaceTitleBtmHeight; // 标题底部间隔
@property(nonatomic, assign) CGFloat spaceDesBtmHeight; // 描述底部间隔


@end
