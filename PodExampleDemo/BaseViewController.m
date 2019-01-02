/*******************************************************************************
 # File        : BaseViewController.m
 # Project     : PodExampleDemo
 # Author      : Jamesholy
 # Created     : 2019/1/2
 # Corporation :
 # Description :
 <#Description Logs#>
 -------------------------------------------------------------------------------
 # Date        : <#Change Date#>
 # Author      : <#Change Author#>
 # Notes       :
 <#Change Logs#>
 ******************************************************************************/

#import "BaseViewController.h"
#import <Masonry.h>
#import "XKEmptyPlaceView.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

#pragma mark ----------------------------- 生命周期 ------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化界面
    [self createUI];
}

#pragma mark - 初始化界面
- (void)createUI {
    self.navigationController.navigationBar.translucent = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}



@end
