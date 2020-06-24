//
//  JSDemoViewController.m
//  demo_JS
//
//  Created by liu on 2018/5/9.
//  Copyright © 2018年 liu. All rights reserved.
//

#import "JSDemoViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface JSDemoViewController ()

@end

@implementation JSDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 符合JS语法的一段JS代码
    NSString *script = @"var triple = function(value) { return value * 3 }; var add = function(a,b) {return a+b}; var num1 = 5; var num2 = 10; var num = add(num1,num2); triple(num)";
    
    JSContext *context = [[JSContext alloc] init];
    JSValue *tripleNum = [context evaluateScript:script];
    
    NSLog(@"tripleNum %@",tripleNum.toNumber);
}

@end
