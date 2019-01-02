# XKEmptyPlaceView



## Example
![image.png](https://upload-images.jianshu.io/upload_images/1956050-5288d401ea4d2372.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 图片+标题
```
 __weak typeof(self) weakSelf = self;
 _emptyView = [XKEmptyPlaceView configScrollView:self.tableView config:nil];
    [_emptyView showWithImgName:@"暂无内容" title:@"暂无数据" des:nil tapClick:^{
        //
    }];
```
![无数据](https://upload-images.jianshu.io/upload_images/1956050-9bde23c7c48668d2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
### 图片+标题+描述
```
    __weak typeof(self) weakSelf = self;
    _emptyView = [XKEmptyPlaceView configScrollView:self.tableView config:nil];
    [_emptyView showWithImgName:@"加载失败" title:@"无法获取网络" des:@"点击屏幕重试" tapClick:^{
        [weakSelf.emptyView hide];
    }];
```
![无网络](https://upload-images.jianshu.io/upload_images/1956050-f428f87db6fcc90a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
### 图片+标题+描述+按钮
```
   __weak typeof(self) weakSelf = self;
    _emptyView = [XKEmptyPlaceView configScrollView:self.tableView config:nil];
    
    _emptyView.config.viewAllowTap = NO;
    [_emptyView showWithImgName:@"加载失败" title:@"无法获取网络" des:@"请检查网络" btnText:@"重试" btnImg:nil tapClick:^{
        [weakSelf.emptyView hide];
    }];
```
![image.png](https://upload-images.jianshu.io/upload_images/1956050-9cebf8bd9c36b0cd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
### 多配置
```
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
```
![image.png](https://upload-images.jianshu.io/upload_images/1956050-165f0cf48cc1e641.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Requirements

## Installation

XKEmptyPlaceView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XKEmptyPlaceView'
```

## Author

sy5075391, 447523382@qq.com

## License

XKEmptyPlaceView is available under the MIT license. See the LICENSE file for more info.

Deme：https://github.com/sy5075391/XKEmptyPlaceView