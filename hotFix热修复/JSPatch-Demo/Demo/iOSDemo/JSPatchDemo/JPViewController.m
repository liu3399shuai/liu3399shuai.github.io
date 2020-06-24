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
    [btn setTitle:@"handleBtn" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 300, [UIScreen mainScreen].bounds.size.width, 50)];
    [btn2 setTitle:@"run engine" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(runJSPatch:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundColor:[UIColor grayColor]];
    btn2.tag = 10;
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 400, [UIScreen mainScreen].bounds.size.width, 50)];
    [btn3 setTitle:@"run patch" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(runPatchCode:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn3];
}

- (void)handleBtn:(id)sender
{
    static NSInteger i = 0;
    
    self.view.backgroundColor = i ? [UIColor redColor] : [UIColor yellowColor];
    
    i = !i;
}

// to replace

//- (void)handleBtn:(id)sender
//{
//    UIColor *color = [UIColor blueColor];
//    UIView *view = self.view;
//    view.backgroundColor = color;
//}

- (void)runJSPatch:(id)sender
{
    [JPEngine startEngine];
    
    NSLog(@"run over");
}

-(void)runPatchCode:(id)sender
{
    NSString *url = @"http://localhost/hotfix_demo.php";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"GET";
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 30;
    config.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error || data.length == 0) {
            NSLog(@"数据获取失败");
            return;
        }
        
        NSError *serializationError;
        NSDictionary *serialData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&serializationError];
        if (![serialData isKindOfClass:[NSDictionary class]]) {
            NSLog(@"数据获取失败");
            return;
        }
        
        NSString *text = [serialData objectForKey:@"hot_fix_text"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [JPEngine evaluateScript:text];
        });
        
        NSLog(@"run over");
    }];
    
    [task resume];
}

@end
