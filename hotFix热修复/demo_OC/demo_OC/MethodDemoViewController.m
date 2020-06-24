//
//  MethodDemoViewController.m
//  demo_OC
//
//  Created by liu on 2018/5/8.
//  Copyright © 2018年 liu. All rights reserved.
//

#import "MethodDemoViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface MethodDemoViewController ()

@end

@implementation MethodDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 50)];
    [btn1 setTitle:@"getList" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(getList) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 100, 50)];
    [btn2 setTitle:@"getInfo" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(getInfo) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 100, 50)];
    [btn3 setTitle:@"add" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(150, 200, 100, 50)];
    [btn4 setTitle:@"exchange" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(exchange) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc] initWithFrame:CGRectMake(0, 300, 100, 50)];
    [btn5 setTitle:@"testBtn5" forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(testBtn5:) forControlEvents:UIControlEventTouchUpInside];
    [btn5 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn5];
    
    UIButton *btn6 = [[UIButton alloc] initWithFrame:CGRectMake(150, 300, 100, 50)];
    [btn6 setTitle:@"testBtn6" forState:UIControlStateNormal];
    [btn6 addTarget:self action:@selector(testBtn6:) forControlEvents:UIControlEventTouchUpInside];
    [btn6 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn6];
}

-(NSInteger)testFunction:(NSString *)text
{
    return 2;
}

-(void)testBtn5:(NSString *)text
{
    self.view.backgroundColor = [UIColor yellowColor];
}

-(void)testBtn6:(NSString *)text
{
    self.view.backgroundColor = [UIColor blueColor];
}

-(void)getList
{
    unsigned int count;
    Method *list = class_copyMethodList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        Method item = list[i];
        SEL sel = method_getName(item);
        NSLog(@"item %@",NSStringFromSelector(sel));
    }
}

-(void)getInfo
{
    SEL selector = NSSelectorFromString(@"testFunction:");
    
    Method method = class_getInstanceMethod([self class], selector);
    
    SEL sel = method_getName(method);
    IMP imp = method_getImplementation(method);
    const char *type = method_getTypeEncoding(method); // typeEncode runtime 和 invocation 里都有
    
    NSLog(@"method name:%s imp:%p type:%s",sel,imp,type);
    
    unsigned int arguNum = method_getNumberOfArguments(method);
    
    for (int i = 0; i < arguNum; i++) {
        const char *type = method_copyArgumentType(method, i);
        NSLog(@"argument %d type %s",i,type);
    }
    
    const char *returnType = method_copyReturnType(method);
    NSLog(@"return type %s",returnType);
}

-(void)add
{
    SEL sel = NSSelectorFromString(@"anyFunctionAdd:");
    
    NSInteger succ = class_addMethod([self class], sel, _objc_msgForward, @"v@:@".UTF8String);
    
    NSLog(@"succ %d",succ);
}

-(void)exchange
{
    SEL selector1 = NSSelectorFromString(@"testBtn5:");
    SEL selector2 = NSSelectorFromString(@"testBtn6:");
    
    Method method1 = class_getInstanceMethod([self class], selector1);
    Method method2 = class_getInstanceMethod([self class], selector2);
    
    IMP imp1 = method_getImplementation(method1);
    IMP imp2 = method_getImplementation(method2);
    
    NSLog(@"before method name:%s imp:%p",selector1,imp1);
    NSLog(@"before method name:%s imp:%p",selector2,imp2);
    
    method_exchangeImplementations(method1, method2);
    
    IMP new_imp1 = method_getImplementation(method1);
    IMP new_imp2 = method_getImplementation(method2);
    
    NSLog(@"after method name:%s imp:%p",selector1,new_imp1);
    NSLog(@"after method name:%s imp:%p",selector2,new_imp2);
}

@end
