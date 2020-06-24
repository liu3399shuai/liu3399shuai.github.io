//
//  ViewController.m
//  demo_OC
//
//  Created by liu on 2018/5/8.
//  Copyright © 2018年 liu. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "DemoClass.h"
#import "ClassDemoController.h"
#import "VarDemoViewController.h"
#import "MethodDemoViewController.h"
#import "MethodInvokeDemoController.h"
#import "MethodForwardDemoController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 50)];
    [btn1 setTitle:@"class" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(gotoClassDemo) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 100, 50)];
    [btn2 setTitle:@"var" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(gotoVarDemo) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 300, 100, 50)];
    [btn3 setTitle:@"method" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(gotoMethod) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 400, 150, 50)];
    [btn4 setTitle:@"methodInvoke" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(gotoMethodInvoke) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc] initWithFrame:CGRectMake(0, 500, 150, 50)];
    [btn5 setTitle:@"methodForward" forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(gotoMethodForward) forControlEvents:UIControlEventTouchUpInside];
    [btn5 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn5];
}

-(void)gotoClassDemo
{
    ClassDemoController *demo = [[ClassDemoController alloc] init];
    [self.navigationController pushViewController:demo animated:YES];
}

-(void)gotoVarDemo
{
    VarDemoViewController *demo = [[VarDemoViewController alloc] init];
    [self.navigationController pushViewController:demo animated:YES];
}

-(void)gotoMethod
{
    MethodDemoViewController *demo = [[MethodDemoViewController alloc] init];
    [self.navigationController pushViewController:demo animated:YES];
}

-(void)gotoMethodInvoke
{
    MethodInvokeDemoController *demo = [[MethodInvokeDemoController alloc] init];
    [self.navigationController pushViewController:demo animated:YES];
}

-(void)gotoMethodForward
{
    MethodForwardDemoController *demo = [[MethodForwardDemoController alloc] init];
    [self.navigationController pushViewController:demo animated:YES];
}

@end
