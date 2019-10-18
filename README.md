# XKEmptyPlaceView



## 介绍
#### 快捷为界面添加占位图（无数据占位图，网络失败占位图等），可调整界面布局，以及动态更新界面。


## 初始化方法及使用
```
 _emptyView = [XKEmptyPlaceView configScrollView:self.tableView config:nil];

 [_emptyView showWithImgName:@"xxx" title:@"xxx" des:nil tapClick:^{ }];
```
可以使用属性存储XKEmptyPlaceView对象，配置后调用占位图的方法显示隐藏。为了方便使用，给UIScrollView加了一个分类，可以不用申明属性，快速使用占位图

## 快捷初始化方法及使用

```
// 初始化方法
 [self.tableView configDefaultEmptyView];
 [self.tableView.emptyPlaceView showWithImgName:@"xxx" title:@"xxxx" des:nil tapClick:^{ }];
```

## 使用范例
```
    [HTTPClient postXXXX:^(id responseObject) {
      self.datas = xxx;
      if (self.datas.count) {
            [self.emptyTipView hide];
        } else {
            [self.emptyTipView showWithImgName:kEmptyPlaceImgName title:nil des:@"暂无数据" tapClick:nil];
        }
    } failure:^(XKHttpErrror *error) {
        if (self.datas.count == 0) {
            __weak typeof(self) weakSelf = self;
            self.emptyTipView.config.viewAllowTap = YES;
            [self.emptyTipView showWithImgName:kNetErrorPlaceImgName title:@"网络错误" des:@"点击屏幕重试" tapClick:^{
                [weakSelf request];
            }];
        }
    }];
```


## 效果
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

- (void)showEmpty {
    __weak typeof(self) weakSelf = self;
    _emptyView.config.viewAllowTap = YES;
    _emptyView.config.titleColor = [UIColor orangeColor];
    [_emptyView showWithImgName:@"暂无内容" title:@"暂无数据" des:@"戳屏幕再刷新" tapClick:^{
        [weakSelf showNetError];
    }];
}

```
![image.png](https://upload-images.jianshu.io/upload_images/1956050-165f0cf48cc1e641.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---
## 使用要点
#### 1. 目前只能用于UIScrollView， 如果普通界面需要使用，可先创建UIScrollView进行承载。
#### 2. config配置是核心，是对界面的显示描述，在show方法调用时，会使用config的配置进行界面的重绘。
#### 3. emptyView自带有config属性，初始化未为传入会自动生成一个默认的config，针对自己的app设计，可以将基础的配置项在默认配置里设置完，外界只配置特殊的。 在展示前可获取congfig进行属性配置，即可继续动态配置占位图的显示效果。 config的界面配置属性如果设置过多，显示其他界面不需要时，可重置，设置可调用`resetConfig`
#### 4. 封装的显示方法里考虑了方便动态更新界面,所以将会动态变化频繁的参数放入了方法中，其实内部也是对config进行的赋值，在show方法之前单独设置的img，title，des会被方法传入的覆盖：

```
/**不带按钮的占位图*/
- (void)showWithImgName:(NSString *)imgName title:(NSString *)title des:(NSString *)des tapClick:(void(^)(void))tap;
/**下方带按钮的 btnImg 可是image or 图片名称*/
- (void)showWithImgName:(NSString *)imgName title:(NSString *)title des:(NSString *)des btnText:(NSString *)btnText btnImg:(id)btnImg tapClick:(void(^)(void))tap;
```
#### 需求场景可为界面先为网络错误占位图，后请求成功为无数据占位。可参考`多配置demo`
#### 5. 视图的点击事件和按钮的点击回调是同一个，当开启`config.viewAllowTap = YES;`,点击屏幕和按钮都会回调block，如果只想按钮点击，设置为NO即可
----




## Installation

XKEmptyPlaceView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XKEmptyPlaceView'
```

## Author

Jamesholy, 447523382@qq.com


Deme：https://github.com/sy5075391/XKEmptyPlaceView
