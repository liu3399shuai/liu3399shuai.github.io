//
//  VarDemoViewController.m
//  demo_OC
//
//  Created by liu on 2018/5/8.
//  Copyright © 2018年 liu. All rights reserved.
//

#import "VarDemoViewController.h"
#import <objc/runtime.h>

@interface VarDemoViewController ()
{
    NSInteger score;
    NSString *student;
}

@property (strong, nonatomic) NSString  *name;
@property (assign, nonatomic) double    age;

@end

@implementation VarDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 50)];
    [btn1 setTitle:@"getVar" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(getVar) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 100, 50)];
    [btn2 setTitle:@"setVar" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(setVar) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 100, 50)];
    [btn3 setTitle:@"copyVar" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(copyVar) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(150, 200, 100, 50)];
    [btn4 setTitle:@"addVar" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(addVar) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn4];
    
}

-(void)getVar
{
    //    property_getName
    //    property_getAttributes
    
    student = @"mike";
    
    Ivar var = class_getInstanceVariable([self class], @"student".UTF8String);
    
    const char *name = ivar_getName(var);
    
    const char *type = ivar_getTypeEncoding(var);
    
    id value = object_getIvar(self, var);
    
    NSLog(@"name: %s type: %s value: %@",name,type,value);
}

-(void)setVar
{
    Ivar var = class_getInstanceVariable([self class], @"student".UTF8String);
    
    object_setIvar(self, var, @"jack");
    
    NSLog(@"value: %@",student);
}

-(void)copyVar
{
    //    class_copyPropertyList
    //    property_copyAttributeList
    
    unsigned int count;
    
    Ivar *varList = class_copyIvarList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        Ivar item = varList[i];
        NSLog(@"var: %s",ivar_getName(item));
    }
}

-(void)addVar
{
    //    class_addProperty
    //    class_replaceProperty
    
    Class cls = objc_allocateClassPair(self.class, "VarSubClass", 0);
    
    NSInteger succ = class_addIvar(cls, @"newStudent".UTF8String, sizeof(NSString *), log(sizeof(NSString *)), @"@".UTF8String);
    
    objc_registerClassPair(cls);
    
    NSLog(@"ivar add %ld",(long)succ);
}

@end
