//
//  FirstViewController.m
//  gitServerObjCSample
//
//  Created by snowman on 2017/02/09.
//  Copyright © 2017年 snowman. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) debug_print {
    
    NSString* msg = @"こんにちは";
    int boy = 12;
    int girl = 10;
    id array = @[@"a", @"b", @"c"];
    

    
    // 出力する
    NSLog(@"%@", msg);
    NSLog(@"%d%d", boy, girl); // 複数の値をカンマで区切る
    NSLog(@"男子 %d ,女子 %d", boy, girl);
    NSLog(@"合計 %d ", boy+ girl);
    NSLog(@"%@",array); // 配列
}

- (void) debug_var {
    int  kokugo = 56;
    int sansu = 67;
    int  goukei;
    kokugo = 56;
    sansu = 67;
    goukei = kokugo + sansu;
    NSLog(@"%d ", goukei);
}

- (void ) separator_test {
    NSString* msg1 = @"こんにちは";
    NSString* msg2 = @"ありがとう";
    NSString* msg3 = @"さようなら";
    NSLog(@"%@／%@／%@/", msg1, msg2, msg3);
}

- (void) kuji {
    // 1〜10の乱数を作る
    int num = arc4random_uniform(10)+1;
    // numの値で処理を分岐する
    if (num>=7) {
        // numが7以上の時
        NSString* msg = @"あたり";
        NSLog(@"%d,%@",num, msg);
    } else {
        // numが7未満の時
        NSString* msg = @"はずれ";
         NSLog(@"%d,%@",num, msg);
    }
}


@end
