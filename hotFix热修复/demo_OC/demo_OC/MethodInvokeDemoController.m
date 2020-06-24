//
//  MethodInvokeDemoViewController.m
//  demo_OC
//
//  Created by liu on 2018/5/9.
//  Copyright © 2018年 liu. All rights reserved.
//

#import "MethodInvokeDemoController.h"
#import <objc/runtime.h>

@interface MethodInvokeDemoController ()

@end

@implementation MethodInvokeDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    Class cls = NSClassFromString(@"MethodInvokeClass");
    SEL sel = NSSelectorFromString(@"testMethodInvoke:");
    NSInteger argu = 15;
    
    Method method = class_getInstanceMethod(cls, sel);
    const char *type = method_getTypeEncoding(method);
    
//    NSMethodSignature 和 method_type 作用一样
    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:type];
    
    id target = [[cls alloc] init];
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.selector = sel;
    invocation.target = target;
    [invocation setArgument:&argu atIndex:2];
    
    [invocation invoke];
    
    double returnValue;
    [invocation getReturnValue:&returnValue];
    
    NSLog(@"return %f",returnValue);
    NSLog(@"invoke %@",invocation);
    
//    每个方法都有self和_cmd两个默认的隐藏参数，self即接收消息的对象本身，_cmd即是selector选择器，所以，描述的大概格式是：返回值@:参数。@即为self,:对应_cmd(selector).返回值和参数根据不同函数定义做具体调整，如 -(NSString *)testMethod2:(NSString *)str;    ->  @@:@
    
//    Printing description of invocation:
//    <NSInvocation: 0x1c40669c0>
//    return value: {d} 0.000000
//    target: {@} 0x1c4010dd0
//    selector: {:} testMethodInvoke:
//    argument 2: {q} 15
}

@end
