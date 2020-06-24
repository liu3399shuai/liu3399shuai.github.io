//
//  JPViewController.m
//  JSPatch
//
//  Created by bang on 15/5/2.
//  Copyright (c) 2015年 bang. All rights reserved.
//

#import "JPViewController.h"
#import "JPEngine.h"

#import <objc/runtime.h>

@implementation JPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50)];
    [btn setTitle:@"Push JPTableViewController" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 300, [UIScreen mainScreen].bounds.size.width, 50)];
    [btn2 setTitle:@"run jspatch" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(runJSPatch:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundColor:[UIColor grayColor]];
    btn2.tag = 10;
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 400, [UIScreen mainScreen].bounds.size.width, 50)];
    [btn3 setTitle:@"run code" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(runPatchCode:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn3];
    
//    [self forwardInvocation:nil];
//    [self methodSignatureForSelector:nil];
    
}

- (void)handleBtn:(id)sender
{
    static NSInteger i = 0;
    
    self.view.backgroundColor = i ? [UIColor redColor] : [UIColor yellowColor];
    
    i = !i;
}

-(void)testtest
{
    static NSInteger i = 0;
    
    UIButton *btn = [self.view viewWithTag: 10];
    btn.backgroundColor = i ? [UIColor redColor] : [UIColor yellowColor];
    
    i = !i;
}

- (void)runJSPatch:(id)sender
{
    [JPEngine startEngine];
}

-(void)runPatchCode:(id)sender
{
    // 运行在JS环境中，OC中生成的对象也被JS持有
    
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"js"];
    NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    [JPEngine evaluateScript:script];
}

@end
