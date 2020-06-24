//
//  ViewController.m
//  demo_hotfix
//
//  Created by liu on 2018/5/10.
//  Copyright © 2018年 liu. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()
{
    NSDictionary    *oc_clsList;
    NSDictionary    *oc_methodList;
    NSDictionary    *oc_varList;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // http://localhost/hotfix_js
    
    JSContext *context = [[JSContext alloc] init];
    
    context[@"_oc_defineClass"] = ^(JSValue *declaration,JSValue *properties,JSValue *instMethods,JSValue *clsMethods){
        
        // 做一些OC层面的逻辑，过滤，转换
        // 利用runtime，invoke进行方法调用;
        // 一些OC新建类，新建变量，新建方法，重写方法实现的代码
    };
    
    context[@"_oc_callSelector"] = ^(JSValue *cls,JSValue *instance,JSValue *method,JSValue *isInstance){
        
        // 做一些OC层面的逻辑，过滤，转换
        // 利用runtime，invoke进行方法调用;
        // 一些OC方法调用的代码
        // 返回值为调用后的returnVaule，传回JS环境
    };
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"js"];
    NSString *jsCore = [[NSString alloc] initWithData:[[NSFileManager defaultManager] contentsAtPath:path] encoding:NSUTF8StringEncoding];
    [context evaluateScript:jsCore withSourceURL:[NSURL URLWithString:@"main.js"]];
}


@end
