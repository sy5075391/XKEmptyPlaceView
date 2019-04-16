# XKEmptyPlaceView



## Example
![image.png](https://upload-images.jianshu.io/upload_images/1956050-5288d401ea4d2372.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 初始化方法
```
 _emptyView = [XKEmptyPlaceView configScrollView:self.tableView config:nil];
```
#### 使用
```
 [_emptyView showWithImgName:@"xxx" title:@"xxx" des:nil tapClick:^{ }];
```
可以使用属性存储XKEmptyPlaceView对象，配置后调用占位图的方法显示隐藏。为了方便使用，给UIScrollView加了一个分类，可以不用申明属性，快速使用占位图

##### 快捷初始化方法

```
// 初始化方法
 [self.tableView configDefaultEmptyView];
 [self.tableView.emptyPlaceView showWithImgName:@"xxx" title:@"xxxx" des:nil tapClick:^{ }];
```
>TIPS： 展示前可获取empty的属性congfig，或者重置config，继续动态配置占位图的显示效果。
----
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
  // 快捷初始化
    [self.tableView configDefaultEmptyView];
    XMEmptyViewConfig *config = self.tableView.emptyPlaceView.config;
    config.titleFont = [UIFont systemFontOfSize:18];
    config.verticalOffset = -50;
    config.btnBackImg = [UIColor orangeColor];
    config.btnColor = [UIColor whiteColor];
    config.btnFont = [UIFont systemFontOfSize:18];
    config.btnMargin = 50;
    config.spaceDesBtmHeight = 20;
    config.spaceTitleBtmHeight = 30;
    [self showNetError];
}

- (void)showNetError {
    __weak typeof(self) weakSelf = self;
    // 展示前可继续动态配置config
    self.tableView.emptyView.config.viewAllowTap = NO;
    self.tableView.emptyView.config.titleColor = [UIColor blackColor];
    [self.tableView.emptyView showWithImgName:@"404出错页面" title:@"不开心\n无法获取网络" des:@"检查一下网络" btnText:@"重试" btnImg:nil tapClick:^{
        [weakSelf showEmpty];
    }];
}
```
![image.png](https://upload-images.jianshu.io/upload_images/1956050-165f0cf48cc1e641.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## Requirements

## Installation

XKEmptyPlaceView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XKEmptyPlaceView'
```

## Author

Jamesholy, 447523382@qq.com


Deme：https://github.com/sy5075391/XKEmptyPlaceView
