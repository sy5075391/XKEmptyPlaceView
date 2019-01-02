//
//  ViewController.m
//  PodExampleDemo
//
//  Created by Jamesholy on 2018/12/29.
//  Copyright © 2018 Jamesholy. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "DemoViewController1.h"
#import "DemoViewController2.h"
#import "DemoViewController3.h"
#import "DemoViewController4.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/**<##>*/
@property(nonatomic, copy) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"占位图Demo";
    self.dataArray = @[@"图片+标题",@"图片标题+标题",@"图片+标题+描述+按钮",@"多参数配置"];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *rid = @"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:rid];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text = self.dataArray[indexPath.row];
    UIViewController *vc;
    if ([text isEqualToString:@"图片+标题"]) {
        vc = [DemoViewController1 new];
    } else if ([text isEqualToString:@"图片标题+标题"]) {
        vc = [DemoViewController2 new];
    } else if ([text isEqualToString:@"图片+标题+描述+按钮"]) {
        vc = [DemoViewController3 new];
    } else if ([text isEqualToString:@"多参数配置"]) {
        vc = [DemoViewController4 new];
    }
    [self.navigationController pushViewController:vc animated:YES];
}


@end
