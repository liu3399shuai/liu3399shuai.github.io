//
//  ViewController.m
//  demo_JS
//
//  Created by liu on 2018/5/9.
//  Copyright © 2018年 liu. All rights reserved.
//

#import "ViewController.h"
#import "JSDemoViewController.h"
#import "JSOCBridgeDemoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 50)];
    [btn1 setTitle:@"js" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(gotoJS) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 150, 50)];
    [btn2 setTitle:@"js-oc-bridge" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(gotoBridge) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn2];
}

-(void)gotoJS
{
    JSDemoViewController *demo = [[JSDemoViewController alloc] init];
    [self.navigationController pushViewController:demo animated:YES];
}

-(void)gotoBridge
{
    JSOCBridgeDemoViewController *demo = [[JSOCBridgeDemoViewController alloc] init];
    [self.navigationController pushViewController:demo animated:YES];
}

@end
