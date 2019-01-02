/*******************************************************************************
 # File        : DemoViewController3.m
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

#import "DemoViewController3.h"

@interface DemoViewController3 ()
/**<##>*/
@property(nonatomic, strong) XKEmptyPlaceView *emptyView;

@end

@implementation DemoViewController3

#pragma mark ----------------------------- 生命周期 ------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    _emptyView = [XKEmptyPlaceView configScrollView:self.tableView config:nil];
    
    _emptyView.config.viewAllowTap = NO;
    [_emptyView showWithImgName:@"加载失败" title:@"无法获取网络" des:@"请检查网络" btnText:@"重试" btnImg:nil tapClick:^{
        [weakSelf.emptyView hide];
    }];
}

@end
