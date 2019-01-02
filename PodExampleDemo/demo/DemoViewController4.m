/*******************************************************************************
 # File        : DemoViewController4.m
 # Project     : PodExampleDemo
 # Author      : Jamesholy
 # Created     : 2019/1/2
 # Corporation : 水木科技
 # Description :
 <#Description Logs#>
 -------------------------------------------------------------------------------
 # Date        : <#Change Date#>
 # Author      : <#Change Author#>
 # Notes       :
 <#Change Logs#>
 ******************************************************************************/

#import "DemoViewController4.h"

@interface DemoViewController4 ()
/**<##>*/
@property(nonatomic, strong) XKEmptyPlaceView *emptyView;

@end

@implementation DemoViewController4

#pragma mark ----------------------------- 生命周期 ------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    
    XMEmptyViewConfig *config = [XMEmptyViewConfig new];
    config.titleFont = [UIFont systemFontOfSize:18];
    config.verticalOffset = -50;
    config.btnBackImg = [UIColor orangeColor];
    config.btnColor = [UIColor whiteColor];
    config.btnFont = [UIFont systemFontOfSize:18];
    config.btnMargin = 50;
    
    config.spaceDesBtmHeight = 20;
    config.spaceTitleBtmHeight = 30;
    
    _emptyView = [XKEmptyPlaceView configScrollView:self.tableView config:config];
    
    [self showNetError];
    
}

- (void)showNetError {
    __weak typeof(self) weakSelf = self;
    // 展示前可继续动态配置config
    self.emptyView.config.viewAllowTap = NO;
    _emptyView.config.titleColor = [UIColor blackColor];
    [_emptyView showWithImgName:@"404出错页面" title:@"不开心\n无法获取网络" des:@"检查一下网络" btnText:@"重试" btnImg:nil tapClick:^{
        [weakSelf showEmpty];
    }];
}

- (void)showEmpty {
    __weak typeof(self) weakSelf = self;
    _emptyView.config.viewAllowTap = YES;
    _emptyView.config.titleColor = [UIColor orangeColor];
    [_emptyView showWithImgName:@"暂无内容" title:@"暂无数据" des:@"戳屏幕再刷新" tapClick:^{
        [weakSelf showNetError];
    }];
}


@end
