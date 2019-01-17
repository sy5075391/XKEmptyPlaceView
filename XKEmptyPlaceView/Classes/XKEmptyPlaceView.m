/*******************************************************************************
 # File        : XKEmptyPlaceView.m
 # Project     :
 # Author      : Jamesholy
 # Created     : 2018/8/23
 # Corporation : 
 # Description :
 <#Description Logs#>
 -------------------------------------------------------------------------------
 # Date        : <#Change Date#>
 # Author      : <#Change Author#>
 # Notes       :
 <#Change Logs#>
 ******************************************************************************/

#import "XKEmptyPlaceView.h"
#import "UIImage+Edit.h"
#define emptyDefaultImg [UIImage imageNamed:@"placeholder_kickstarter"]

// RGB颜色
#define RGB(r,g,b) RGBA(r,g,b,1)
// RGB颜色 灰色
#define RGBGRAY(A) RGB(A,A,A)
// 16进制颜色
#define HEX_RGB(rgbValue) HEX_RGBA(rgbValue, 1.0)
// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

// 16进制颜色+透明度
#define HEX_RGBA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0f \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0f \
blue:((float)(rgbValue & 0x0000FF))/255.0f \
alpha:alphaValue]


@interface XMEmptyViewConfig()


@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *desc;
@property(nonatomic, copy) NSString *btnText;
@property(nonatomic, strong) id  btnImg;
@property(nonatomic, assign) BOOL show;
/**按钮左右inset设置 根据BtnMargin设置的*/
@property(nonatomic) UIEdgeInsets  rectInsets;

@end


@implementation  XMEmptyViewConfig

- (instancetype)init {
    if (self = [super init]) {
        self.image = emptyDefaultImg;
        self.titleColor = RGBGRAY(51);
        self.viewAllowTap = YES;
        self.titleFont = [UIFont systemFontOfSize:16];
        self.backgroundColor = HEX_RGB(0xF6F6F6);
        self.capInsets = UIEdgeInsetsMake(11.0, 11.0, 11.0, 11.0);
        self.rectInsets = UIEdgeInsetsMake(0, -0, 0, -0);
        self.btnFont = [UIFont systemFontOfSize:14];
        self.btnColor = HEX_RGB(0x4A90FA);
        self.descriptionColor = HEX_RGB(0x777777);
        self.descriptionFont = [UIFont systemFontOfSize:14];;
        self.btnMargin = 15;
        self.spaceHeight = 8;
    }
    return self;
}

- (void)setImage:(UIImage *)image {
    if (self.useSpecialImageSize) {
        _image = image;
    } else {
        if (self.specialImageSize.height == 0 || self.specialImageSize.height == 0) {
            _image = image;
        } else {
            _image = [self imageResize:image andResizeTo:self.specialImageSize];
        }
    }
}

- (void)setTopOffset:(CGFloat)topOffset {
    _topOffset = topOffset;
    _verticalOffset = 0;
    _topMutiOffset = 0;
}

- (void)setTopMutiOffset:(CGFloat)topMutiOffset {
    _topMutiOffset = topMutiOffset;
    _verticalOffset = 0;
    _topOffset = 0;
}

- (void)setVerticalOffset:(CGFloat)verticalOffset {
    _verticalOffset = verticalOffset;
    _topMutiOffset = 0;
    _topOffset = 0;
}

-(UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize {
    CGFloat scale = [[UIScreen mainScreen]scale];
    
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
    [img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
- (void)setSpaceHeight:(CGFloat)spaceHeight {
    _spaceHeight = spaceHeight;
    self.spaceImgBtmHeight = spaceHeight;
    self.spaceTitleBtmHeight = spaceHeight;
    self.spaceDesBtmHeight = spaceHeight;
}

- (void)setBtnMargin:(CGFloat)btnMargin {
    _btnMargin = btnMargin;
    self.rectInsets = UIEdgeInsetsMake(0, -self.btnMargin, 0, -self.btnMargin);
}

- (void)setBtnBackImg:(id)btnBackImg {
    _btnBackImg = btnBackImg;
    if ([btnBackImg isKindOfClass:[UIColor class]]) {
        _btnBackImg = [XMEmptyViewConfig createBtnBackImg:btnBackImg];
    }
}

+ (UIImage *)createBtnBackImg:(UIColor *)color {
    UIImage *image = [UIImage imageWithColor:color rect:CGRectMake(0, 0, 400, 44)];
    image = [image roundImageWithCorners:UIRectCornerAllCorners radius:8];
    return image;
    
}
@end


@interface XKEmptyPlaceView () <XKEmptyDataSetSource,XKEmptyDataSetDelegate>

/**scrollView*/
@property(nonatomic, weak) UIScrollView *scrollView;
/**视图配置器*/
@property(nonatomic, strong) XMEmptyViewConfig *config;
/**点击回调*/
@property(nonatomic, copy) void(^tapBlock)(void) ;
@end

@implementation XKEmptyPlaceView

+ (instancetype)configScrollView:(UIScrollView *)scrollView config:(XMEmptyViewConfig *)config {
    
    XKEmptyPlaceView *placeView = [[XKEmptyPlaceView alloc] initPrivate];
    if (config == nil) {
        placeView.config = [[XMEmptyViewConfig alloc] init];
    } else {
        placeView.config = config;
    }
    scrollView.emptyDataSetSource = placeView;
    scrollView.emptyDataSetDelegate = placeView;
    placeView.scrollView = scrollView;
    return placeView;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"XKEmptyPlaceView" reason:@"用configScrollView初始化嘛" userInfo:nil];
}

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)resetConfig {
    _config = [[XMEmptyViewConfig alloc] init];
}

- (void)showWithImgName:(NSString *)imgName title:(NSString *)title des:(NSString *)des tapClick:(void (^)(void))tap {
    
    [self showWithImgName:imgName title:title des:des btnText:nil btnImg:nil tapClick:tap];
}

- (void)showWithImgName:(NSString *)imgName title:(NSString *)title des:(NSString *)des btnText:(NSString *)btnText btnImg:(id)btnImg tapClick:(void(^)(void))tap{
    self.config.show = YES;
    self.config.image = imgName?[UIImage imageNamed:imgName]:emptyDefaultImg;
    self.config.title = title;
    self.config.desc = des;
    self.config.btnText = btnText;
    self.config.btnImg = btnImg;
    self.tapBlock = tap;
    [self load];
}

- (void)hide {
    self.config.show = NO;
    [self load];
}

- (void)load {
    //    if ([self.scrollView respondsToSelector:@selector(reloadData)]) {
    //        [self.scrollView performSelector:@selector(reloadData)];
    //    } else {
    [self.scrollView reloadEmptyDataSet];
    //    }
}

#pragma mark - DZNEmptyDataSetSource Methods

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    NSString * text = self.config.title;
    UIFont *font = self.config.titleFont;
    UIColor *textColor = self.config.titleColor;
    
    if (text.length == 0) {
        return nil;
    }
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSString * text = self.config.desc;
    UIFont *font = self.config.descriptionFont;
    UIColor *textColor = self.config.descriptionColor;
    
    if (text.length == 0) {
        return nil;
    }
    
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    if (paragraph) [attributes setObject:paragraph forKey:NSParagraphStyleAttributeName];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    
    return attributedString;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    UIImage *image = self.config.image;
    return image;
}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0) ];
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    NSString *text = self.config.btnText;
    UIFont *font = self.config.btnFont;
    UIColor *textColor = self.config.btnColor;
    
    if (text.length == 0) {
        return nil;
    }
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    if (self.config.btnBackImg == nil) {
        return nil;
    }
    UIImage *image;
    if ([self.config.btnBackImg isKindOfClass:[UIImage class]]) {
        image = self.config.btnBackImg;
    } else {
        image = [UIImage imageNamed:self.config.btnBackImg];
    }
    
    UIEdgeInsets  capInsets = self.config.capInsets;
    UIEdgeInsets  rectInsets = self.config.rectInsets;
    
    image = [[image resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch] imageWithAlignmentRectInsets:rectInsets];
    return image;
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    if (self.config.btnImg) {
        if ([self.config.btnImg isKindOfClass:[UIImage class]]) {
            UIImage *image = self.config.btnImg;
            return image;
        }
        return [UIImage imageNamed:self.config.btnImg];
    }
    return nil;
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return self.config.backgroundColor;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return self.config.verticalOffset;
}

- (CGFloat)topOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return self.config.topOffset;
}

- (CGFloat)topOffsetMultiplierForEmptyDataSet:(UIScrollView *)scrollView {
    return self.config.topMutiOffset;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    return 8;
}

- (CGFloat)imgBtmSpaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    return self.config.spaceImgBtmHeight;
}

- (CGFloat)titleBtmSpaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    return self.config.spaceTitleBtmHeight;
}

- (CGFloat)desBtmSpaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    return self.config.spaceDesBtmHeight;
}


#pragma mark - DZNEmptyDataSetDelegate Methods

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    return YES;
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView {
    return YES;
}

- (BOOL)emptyDataSetShouldBeForcedToDisplay:(UIScrollView *)scrollView {
    return self.config.show;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return self.config.allowScroll;
}

- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView {
    return NO;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view {
    if (self.config.viewAllowTap) {
        if (self.tapBlock) {
            self.tapBlock();
        }
    }
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    if (self.tapBlock) {
        self.tapBlock();
    }
}

@end


