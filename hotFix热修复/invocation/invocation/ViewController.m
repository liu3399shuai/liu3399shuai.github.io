//
//  ViewController.m
//  invocation
//
//  Created by liu on 2018/5/2.
//  Copyright © 2018年 liu. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "TestObj.h"


@interface ViewController ()
{
    UIButton *vv;
    TestObj *tobj;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *v = [UIButton buttonWithType:0];
    v.frame = CGRectMake(0, 100, 100, 50);
    v.backgroundColor = [UIColor redColor];
    [v addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:v];
    vv = v;
    
    NSLog(@"btn %@",vv);
    
    NSLog(@"self %@",self);
    
    tobj = [[TestObj alloc] init];
    
    NSLog(@"tobj %@",tobj);
    
    IMP imp = class_replaceMethod([tobj class], @selector(forwardInvocation:), (IMP)JPForwardInvocation, "v@:@");
    
    NSLog(@"imp %@",imp);
    
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
}

-(void)btnClick:(UIButton *)btn
{
    [tobj performSelector:@selector(gotoNext) withObject:nil];
}

static void JPForwardInvocation(__unsafe_unretained id assignSlf, SEL selector, NSInvocation *invocation)
{
    NSLog(@"JPForwardInvocation %@ %@",assignSlf,NSStringFromSelector(selector));
    
    NSMethodSignature *methodSignature = [invocation methodSignature];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    
    
}


@end
