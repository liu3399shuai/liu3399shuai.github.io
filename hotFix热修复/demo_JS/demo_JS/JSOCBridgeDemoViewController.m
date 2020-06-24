//
//  JSOCBridgeDemoViewController.m
//  demo_JS
//
//  Created by liu on 2018/5/9.
//  Copyright © 2018年 liu. All rights reserved.
//

#import "JSOCBridgeDemoViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface JSOCBridgeDemoViewController ()
{
    JSContext       *context;
}
@end

@implementation JSOCBridgeDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 150, 50)];
    [btn1 setTitle:@"addFunction" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(addFunction) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 150, 50)];
    [btn2 setTitle:@"callFunction" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(callFunction) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn2];
    
    context = [[JSContext alloc] init];
}

-(void)addFunction
{
    // js实现的方法，注入到js context中
    NSString *script = @"function _js_add(a,b) {return a+b}";
    [context evaluateScript:script];
    
    // OC实现的方法，注入到js context中
    context[@"_oc_add"] = ^(NSInteger a, NSInteger b){
        NSLog(@"oc a %ld b %ld",(long)a,(long)b);
        return a + b;
    };
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"js"];
    NSString *jsCore = [[NSString alloc] initWithData:[[NSFileManager defaultManager] contentsAtPath:path] encoding:NSUTF8StringEncoding];
    [context evaluateScript:jsCore withSourceURL:[NSURL URLWithString:@"main.js"]];
    
    // 打开模拟器查看效果
}

-(void)callFunction
{
    // OC调用JS方法
    JSValue *jsAddFunc = context[@"_js_add"];
    JSValue *jsAddFuncResult = [jsAddFunc callWithArguments: @[@1,@5]];
    
    NSLog(@"jsAddFuncResult %@",jsAddFuncResult.toNumber);
    
    // JS调用OC方法
    JSValue *ocAddFuncResult1 = [context evaluateScript:@"_oc_add(1,5)"];
    
    [context evaluateScript:@"var num = _oc_add(1,5)"];
    JSValue *ocAddFuncResult2 = context[@"num"];
    
    NSLog(@"ocAddFuncResult %@ %@",ocAddFuncResult1.toNumber,ocAddFuncResult2.toNumber);
}

@end
