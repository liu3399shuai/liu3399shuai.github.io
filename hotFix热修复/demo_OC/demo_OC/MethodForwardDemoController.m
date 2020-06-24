//
//  MethodForwardDemoController.m
//  demo_OC
//
//  Created by liu on 2018/5/9.
//  Copyright © 2018年 liu. All rights reserved.
//

#import "MethodForwardDemoController.h"
#import <objc/runtime.h>

@interface MethodForwardDemoController ()

@end

@implementation MethodForwardDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 150, 50)];
    [btn1 setTitle:@"invokeFunction1" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(invokeFunction1) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 150, 50)];
    [btn2 setTitle:@"invokeFunction2" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(invokeFunction2) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 300, 150, 50)];
    [btn3 setTitle:@"invokeFunction3" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(invokeFunction3) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn3];
}

-(void)invokeFunction1
{
    SEL sel = NSSelectorFromString(@"testFunction1:");
    
    [self performSelector:sel withObject:self withObject:nil];
}

-(void)invokeFunction2
{
    SEL sel = NSSelectorFromString(@"testFunction2:");
    
    [self performSelector:sel withObject:self withObject:nil];
}

-(void)invokeFunction3
{
    SEL sel = NSSelectorFromString(@"testFunction3:");
    
    [self performSelector:sel withObject:self withObject:nil];
}

-(void)testFunction1:(NSString *)name
{
    NSLog(@"testFunction1 invoked");
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [NSMethodSignature signatureWithObjCTypes:@"v@:@".UTF8String];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"forwardInvocation %s",anInvocation.selector);
}


@end
