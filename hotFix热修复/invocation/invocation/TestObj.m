//
//  TestObj.m
//  invocation
//
//  Created by liu on 2018/5/2.
//  Copyright © 2018年 liu. All rights reserved.
//

#import "TestObj.h"

@implementation TestObj

-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
}

@end
