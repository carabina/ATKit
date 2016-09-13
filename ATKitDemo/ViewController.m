//
//  ViewController.m
//  ATKitDemo
//
//  Created by Aesir Titan on 2016-09-12.
//  Copyright © 2016 Titan Studio. All rights reserved.
//

#import "ViewController.h"
#import "MyProfiles.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
}
//
//
//- (void)readWriteCustomClass{
//    // 存取自定义类
//    MyProfiles *myfile = [[MyProfiles alloc] init];
//    // 在cache路径下归档一个名为"myfile.plist"的文件，文件需实现NSCoding协议
//    BOOL result = @"myfile".cachePath.saveArchivedPlist(myfile);
//    // 在cache路径下读取一个名为"vc.plist"的已归档的文件
//    MyProfiles *read = @"myfile".cachePath.readArchivedPlist;
//}
//
//
//- (void)readWriteArray{
//    // 存取数组(或字典)
//    // 在doc路径下保存一个名为"arr.plist"的文件
//    NSArray *arr = [NSArray array];
//    BOOL result = @"arr".docPath.savePlist(arr);
//    NSArray *read = @"arr".docPath.readArray;
//    // 存取可变数组(或可变字典)
//    NSMutableArray *mArr = [NSMutableArray array];
//    result = @"mArr".docPath.savePlist(mArr);
//    NSMutableArray *readM = @"mArr".docPath.readArray;
//    
//}
//
//- (void)readWriteText{
//    // 存取文本
//    NSString *str = @"这是需要保存的文本内容";
//    BOOL result = @"text".txt.save(str);
//    NSString *readStr = @"text".readTxt;
//    // 或NSString *readStr = @"text".txt.readTxt; 请放心使用，不会重复添加相同的后缀名
//    
//}
//
//- (void)subPaths{
//    // 获取doc/myDir 路径下所有的扩展名为"plist"文件路径
//    NSArray *paths = @"myDir".docPath.subpaths(@"plist");
//    // 如果传入值为空，则不区分扩展名获取所有文件路径
//    NSArray *paths2 = @"myDir".docPath.subpaths(@"");
//    // paths里面装的是doc/myDir路径下的所有文件完整路径
//}
//
//- (void)others{
//    // 首先确定文件名是"abc"
//    NSString *path = @"abc";        // path = @"abc"
//    // 指定扩展名，这一步有点鸡肋，你也可以直接在第一步里确定
//    NSString *path2 = path.txt; // plistPath = @"abc.txt"
//    // 确定文件在哪里,doc/cache/tmp等等
//    NSString *path3 = path2.docPath;
//    // path3 = @"~/documents/abc.txt" (沙盒路径的documents目录)
//    // NSString *path100 = path.path(NSSearchPathDirectory); 传入NSSearchPathDirectory
//    
//    // 如果你有一张图片在bundle里
//    NSString *imageName = @"image";
//    NSString *imagePath = imageName.mainBundlePath;
//    UIImage *image = [UIImage imageWithContentsOfFile:image];
//    // 如果你有一组(例如10张)图片在bundle里，名分别为image0,image1,image2,...,image9
//    NSArray<UIImage *> *images = [UIImage at_imageWithBundleImageName:image count:10];
//    
//    BOOL result = docPath.save(@"这是要保存的内容");
//    
//    // 读取的时候，必须指定扩展名（不用担心重复的扩展名）
//    id read = docPath.readTxt;
//    
//    // .plist
//    // .json
//    // .txt
//    // 或其他的后缀名
//    NSString *filePath = path.extension(@"exe");
//    // otherPath = @"abc.exe"
//    // 读取的时候，需要指定扩展名
//    id readFile = filePath.extension(@"exe").readArchivedFile;
//    
//}




@end
