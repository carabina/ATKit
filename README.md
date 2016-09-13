[![](Resources/Icons/Header.png)](http://ayan.site)

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/AesirTitan/ATKit/master/LICENSE) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods](http://img.shields.io/cocoapods/v/ATKit.svg?style=flat)](http://cocoapods.org/?q=ATKit) [![CocoaPods](http://img.shields.io/cocoapods/p/ATKit.svg?style=flat)](http://cocoapods.org/?q=ATKit) [![Support](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/) 



# Installation

#### CocoaPods

1. Add `pod 'ATKit'` to your Podfile.
2. Run `pod install` or `pod update` .
3. Import `<ATKit/ATKit.h>` .



#### Framework

1. Download all the files in the `ATKit` subdirectory.
2. Add the `ATKit/Products/ATKit.framework` to your Xcode project.
3. Add `-ObjC` to `Other Linker Flags` in `/target/Build Setting` .
4. Import `<ATKit/ATKit.h>` .



#### Manually

1. Download all the files in the `ATKit` subdirectory.
2. Delete `ATKit/Info.plist` and add the `ATKit/*` to your Xcode project.
3. Import `"ATKit.h"` .







## Modules

| Module        | Description                        |
| ------------- | ---------------------------------- |
| ATFoundation  | Foundation extension and wrapper   |
| ATProgressHUD | a easy-to-use pop view             |
| ATCarousel    | a carousel view                    |
| ATDrawer      | drawer gesture controller          |
| ATTabBar      | a slideable tabbar view controller |





## Documents

These documents have published to author [**@AesirTitan**](http://www.jianshu.com/users/8a50e44f862a/latest_articles) 's  [**ATKit开源框架**](http://www.jianshu.com/notebooks/6236581/latest) subject。

#### ATFoundation

Advice on this part of the global header file is used, contains a lot of the strengthening of the basis functions.

- **[FileStream chained wrapper, more elegantly access sandbox files](http://www.jianshu.com/p/6e9f562d81d2)**

#### ATProgressHUD

Prompt dialog box controls.

#### ATDrawer

Lateral spreads gestures framework.

#### ATCarousel

Carousel view framework.

#### ATTabBar

Slideable TabBar framework (currently only at the top of the title bar of the TabBar)





## License

ATKit is available under the MIT license. See the LICENSE file for more info.







## 安装

#### CocoaPods 方式

1. 在Podfile中添加 `pod 'ATKit'` 。
2. 执行 `pod install` 或者 `pod update` 。
3. 导入头文件 `<ATKit/ATKit.h>` 。



#### 静态库方式

1. 下载所有源码。

2. 把 `ATKit/Products/ATKit.framework` 添加到项目中。

3. 如果项目中第一次使用静态库，需要在target的Build Setting中搜索`Other Linker Flags`

   为`Other Linker Flags`添加`-ObjC` 。

4. 导入头文件 `<ATKit/ATKit.h>` 。



#### 手动导入

1. 下载所有源码。
2. 删除 `ATKit` 文件夹下的 `Info.plist` 文件，并把  `ATKit` 文件夹所有源码拖入项目中。
3. 导入头文件 `"ATKit.h"` 。







## 模块

| 模块            | 描述                       |
| ------------- | ------------------------ |
| ATFoundation  | Foundation 的扩展和增强        |
| ATProgressHUD | 一个简单易用的提示框               |
| ATCarousel    | 轮播图                      |
| ATDrawer      | 侧滑手势框架                   |
| ATTabBar      | 可滑动的TabBar(目前只有顶部TabBar) |





## 详细使用文档

以下文档发布在作者[**@AesirTitan**](http://www.jianshu.com/users/8a50e44f862a/latest_articles)的简书[**ATKit开源框架**](http://www.jianshu.com/notebooks/6236581/latest)专题。

#### ATFoundation

这一部分建议放在全局头文件中使用，包含了很多基础功能的强化

- **[FileStream链式封装，更优雅地存取沙盒文件](http://www.jianshu.com/p/6e9f562d81d2)**


#### ATProgressHUD

提示框控件

#### ATDrawer

侧滑手势

#### ATCarousel

轮播图

#### ATTabBar

支持滑动的TabBar框架（目前只有顶部标题栏的TabBar）





# 许可证

ATKit 使用 MIT 许可证，详情见 LICENSE 文件。



