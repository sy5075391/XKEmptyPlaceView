/*******************************************************************************
 # File        : DemoViewController2.m
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

#import "DemoViewController2.h"

@interface DemoViewController2 ()
/**<##>*/
@property(nonatomic, strong) XKEmptyPlaceView *emptyView;

@end

@implementation DemoViewController2

#pragma mark ----------------------------- 生命周期 ------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    _emptyView = [XKEmptyPlaceView configScrollView:self.tableView config:nil];
    [_emptyView showWithImgName:@"加载失败" title:@"无法获取网络" des:@"点击屏幕重试" tapClick:^{
        [weakSelf.emptyView hide];
    }];
}

@end
