//
//  ClassDemoController.m
//  demo_OC
//
//  Created by liu on 2018/5/8.
//  Copyright © 2018年 liu. All rights reserved.
//

#import "ClassDemoController.h"
#import <objc/runtime.h>
#import "DemoClass.h"

@interface ClassDemoController ()

@end

@implementation ClassDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 50)];
    [btn1 setTitle:@"transform" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(transform) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 100, 50)];
    [btn2 setTitle:@"add" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 100, 50)];
    [btn3 setTitle:@"super" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(getSuper) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(150, 200, 100, 50)];
    [btn4 setTitle:@"query" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(query) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn4];
}

-(void)transform
{
    // 类字符串、类、类实例 转换
    
    NSString *demoClsStr = @"DemoClass";
    
    Class demoCls = [DemoClass class];
    
    Class demoClsGen1 = NSClassFromString(demoClsStr);
    
    NSString *demoClsStrGen = NSStringFromClass(demoCls);
    
    
    DemoClass *demoClsIns1 = DemoClass.new;
    DemoClass *demoClsIns2 = demoClsGen1.new;
    
    Class demoClsGen2 = object_getClass(demoClsIns1);
    Class demoClsGen3 = object_getClass(demoClsIns2);
    
    NSInteger strEqual = [demoClsStr isEqualToString:demoClsStrGen];
    
    NSInteger clsEqual = [demoCls isEqual: demoClsGen1] && [demoCls isEqual: demoClsGen2] && [demoCls isEqual: demoClsGen3];
    
    NSLog(@"strEqual %ld , clsEqual %ld",(long)strEqual,(long)clsEqual);
}

-(void)add
{
    // 添加新类
    NSString *subClsStr = @"SubDemoClass";
    
    Class demoSubCls = objc_allocateClassPair([DemoClass class], subClsStr.UTF8String, 0);
    objc_registerClassPair(demoSubCls);
    
    NSInteger isSub = [demoSubCls isSubclassOfClass:[DemoClass class]];
    NSLog(@"isSub %ld",(long)isSub);
    
    Class subCls = NSClassFromString(subClsStr);
    NSLog(@"subCls %@",subCls);
}

-(void)getSuper
{
    // 获取父类
    
    Class demoCls = [DemoClass class];
    Class demoSuperCls = class_getSuperclass(demoCls);
    NSLog(@"getSuper %@",demoSuperCls);
}

-(void)query
{
    // 获取类列表，查找
    unsigned int count;
    Class *clsList = objc_copyClassList(&count);
    
    for (int i = 0; i < count; i++) {
        Class item = clsList[i];
        NSLog(@"class %s",class_getName(item));
    }
    
    NSLog(@"class count %d",count);
}

@end
