//
//  JPViewController.m
//  JSPatch
//
//  Created by bang on 15/5/2.
//  Copyright (c) 2015年 bang. All rights reserved.
//

#import "JPViewController.h"
#import "JPEngine.h"

@implementation JPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [JPEngine handleException:^(NSString *msg) {
        NSLog(@"jsp %@",msg);
    }];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 150, 50)];
    [btn1 setTitle:@"run local demo.js" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(handleBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 150, 50)];
    [btn2 setTitle:@"run remote" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(handleBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 300, 100, 50)];
    [btn3 setTitle:@"click btn1" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(handleBtn3:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(200, 300, 100, 50)];
    [btn4 setTitle:@"click btn2" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(handleBtn4:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn4];
}

- (void)handleBtn1:(id)sender
{
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"js"];
    NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    
    [JPEngine evaluateScript:script];
    
    NSLog(@"run over");
}

- (void)handleBtn2:(id)sender
{
    NSString *url = @"http://localhost/hotfix_demo_original.php";
    
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

- (void)handleBtn3:(id)sender
{
    static NSInteger i = 0;
    
    self.view.backgroundColor = i ? [UIColor redColor] : [UIColor yellowColor];
    
    i = !i;
}

- (void)handleBtn4:(id)sender
{
    static NSInteger i = 0;
    
    self.view.backgroundColor = i ? [UIColor purpleColor] : [UIColor blueColor];
    
    i = !i;
}

@end


