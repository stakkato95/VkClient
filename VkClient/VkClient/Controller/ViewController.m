//
//  ViewController.m
//  VkClient
//
//  Created by Artsiom Kaliaha on 13/08/15.
//  Copyright (c) 2015 Artsiom Kaliaha. All rights reserved.
//

#import "ViewController.h"
#import "VKCUser.h"
#import "NSStringAdditions.h"
#import "VKCBlocks.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //fun with classes
    VKCUser *user = [VKCUser userWithFirstName:@"Artsiom" secondName:@"Kaliaha"];
    [user checkStringRange];
    NSString *str = @"";
    BOOL result = [str vkc_isNilOrEmpty];
    
    
    //fun with collections
    NSArray *array = @[user, str, [NSNumber numberWithBool:result]];
    NSEnumerator *enumerator = [array objectEnumerator];
    id currentObject;
    while (currentObject = [enumerator nextObject]) {
        continue;
    }
    
//    fun with blocks
//    the mos simple block
//    void (^simpleBlock)() = ^ {
//        
//    };
//    LOOK AT THE PRETTIEST VARIANT, MAN!!!!!!!!!!!
//    typedef void (^Callback)();
//    Callback callback = ^ void () {
//        
//    };
    
    Callback callback = ^ void () {
        __weak ViewController *weakSelf = self;
        [weakSelf printLogMessage:@"PRINTED WIA WEAK SELF REFERENCE"];
    };
    callback();
    
    
    __block int externalToBlockNimber = 30;
    
//THE FIRST variant looks clearer
//1.    int (^aBlock)(int, float, NSNumber *) = ^ int (int firstNumber, float secondNumber, NSNumber *nsNumber) {
//2.    int (^aBlock)(int, float, NSNumber *) = ^ (int firstNumber, float secondNumber, NSNumber *nsNumber) {
    int (^aBlock)(int, float, NSNumber *) = ^ (int firstNumber, float secondNumber, NSNumber *nsNumber) {
        externalToBlockNimber = 999;
        int result = firstNumber + (int)secondNumber + [nsNumber intValue] + externalToBlockNimber;
        NSLog(@"It seems to be my first use of log with int value %d", result);
        return result;
    };
    
    externalToBlockNimber = 60;
    int resultOfBlockInvocation = aBlock(0, 0, [NSNumber numberWithInt:0]);
    NSLog(@"External before %D\nExternal after %D", resultOfBlockInvocation, externalToBlockNimber);
    
    
//METHOD INVOCATION WITH BLOCK!!!
    [user someMethodWithIntParam:7 floatParam:3 nsNumberParam:[NSNumber numberWithInt:5] block:^(int one, float two, NSNumber * three) {
        NSLog(@"WORKS!!! %d", one + (int)two + [three intValue]);
    }];
    
    [user performBlockCallback:^{
        NSLog(@"Callback to log");
    }];
    
//    ITERATE OVER ARRAY
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"given object with index %lu", (unsigned long)idx);
    }];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)printLogMessage:(NSString *)message {
//      REMOVE PRAGMAS & YOU'LL SEE MAGIC!!!
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wformat-security"
    NSLog(message);
#pragma clang diagnostic pop
}

@end
