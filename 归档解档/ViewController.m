//
//  ViewController.m
//  归档解档
//
//  Created by 王月超 on 2017/11/10.
//  Copyright © 2017年 wyc. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *Name = @"wyc";
    //第一个常量NSDocumentDirectory表示正在查找沙盒Document目录的路径（如果参数为NSCachesDirectory则表示沙盒Cache目录），
    //第二个常量NSUserDomainMask表明我们希望将搜索限制在应用的沙盒内；
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathDirectory = [paths lastObject];
    NSLog(@"Documents目录路径=%@",pathDirectory);
    //创建文件stringByAppendingPathComponent:路径拼接
    NSString *filePath = [pathDirectory stringByAppendingPathComponent:@"wyc"];
    NSLog(@"filePath===%@",filePath);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]){
        
    }else{
        NSError *error ;
        BOOL isSuccess = [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:&error];
        if (isSuccess) {
            NSLog(@"创建文件夹成功");
        }else{
            NSLog(@"创建文件夹失败");
        }
    }
    //深一层文件路径
    NSString* fileDirectory = [filePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.arc",Name]];
    NSLog(@"new === %@",fileDirectory);
    //解档
    Person *man = [[Person alloc]init];
    man.name = @"大傻";
    man.age = @"18";
    BOOL success = [NSKeyedArchiver archiveRootObject:man toFile:fileDirectory];
    if (success){
        NSLog(@"归档成功");
    }else{
        NSLog(@"归档失败");
    }
   id  getFile = [NSKeyedUnarchiver unarchiveObjectWithFile:fileDirectory];
    NSLog(@"%@",getFile);
    
    // Do any additional setup after loading the view, typically from a nib.
}
//移除文件
-(BOOL)removeFile:(NSString *)fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0]stringByAppendingPathComponent:@"wyc"];
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:path]){
        return YES;
    }
    NSString* fileDirectory = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.arc",fileName]];
    BOOL success = [manager removeItemAtPath:fileDirectory error:nil];
    if (success){
        return YES;
    }
    else{
        return NO;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
