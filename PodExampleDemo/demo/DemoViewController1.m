/*******************************************************************************
 # File        : DemoViewController1.m
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

#import "DemoViewController1.h"

@interface DemoViewController1 ()
/**<##>*/
@property(nonatomic, strong) XKEmptyPlaceView *emptyView;
@end

@implementation DemoViewController1

#pragma mark ----------------------------- 生命周期 ------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView configDefaultEmptyView];
    [self.tableView.emptyPlaceView showWithImgName:@"暂无内容" title:@"暂无数据" des:nil tapClick:^{
        //
    }];
}

@end
