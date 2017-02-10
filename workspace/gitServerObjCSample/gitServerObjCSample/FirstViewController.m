//
//  FirstViewController.m
//  gitServerObjCSample
//
//  Created by snowman on 2017/02/09.
//  Copyright © 2017年 snowman. All rights reserved.
//

#import "FirstViewController.h"
#import  "AppDelegate.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //#1 print sample
    [self debugPrint];
    //#2 var sample
    [self debugVar];
    //#3 separator sample
    [self separator];
    //#4 if sample
    [self kujiSample];
    //#5 tuple sample
    [self rangeOperationForDouble:-5 end:5 condition:@[@"-8",@"-3",@"2", @"5",@"7"]];
    [self rangeOperationForDouble:0.0 end:1.0 condition:@[@"0.1",@"1.0",@"1.5"]];
    
    //#6 skip...
    //#7 switch-String sample
    
    [self switchSample:@"1"];
    //#8 skip...
    //#9 skip...
    //#10 skip...
    //#11 for-char sample
    [self forLoopChar];
    
    //#12 repeat while loop sample
    [self repeatWhileLoopSample];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) debugPrint {
    
    NSLOG_METHOD
    
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

- (void) debugVar {
    
    NSLOG_METHOD
    int  kokugo = 56;
    int sansu = 67;
    int  goukei;
    kokugo = 56;
    sansu = 67;
    goukei = kokugo + sansu;
    NSLog(@"%d ", goukei);
}

- (void ) separator {
    NSLOG_METHOD
    NSString* msg1 = @"こんにちは";
    NSString* msg2 = @"ありがとう";
    NSString* msg3 = @"さようなら";
    NSLog(@"%@／%@／%@/", msg1, msg2, msg3);
}

- (void) kujiSample {
    NSLOG_METHOD
    // 1〜10の乱数を作る
    int num = arc4random_uniform(10)+1;
    // numの値で処理を分岐する
    if (num>=7) {
        // numが7以上の時
        NSString* msg = @"あたり";
        NSLog(@"kuji:%d,%@",num, msg);
    } else {
        // numが7未満の時
        NSString* msg = @"はずれ";
         NSLog(@"kuji:%d,%@",num, msg);
    }
}
//#7 switch-String sample

- (void) switchSample: (NSString*) input {
    
    switch(input.integerValue) {
        case 1:
        case 2:
        case 3:
            //処理A;
            break;
        case 5:
            break;
            //処理B;
        default:
            NSLog(@"%@ ", input);
            break;
    }
    
    if([input isEqualToString:@"red" ] ||
       [input isEqualToString:@"yellow" ]) {
        NSLog(@"赤と黄色は注意");
    } else if([input isEqualToString:@"green" ] ) {
        NSLog(@"緑は快適");
    } else if([input isEqualToString:@"gray" ] ) {
        NSLog(@"グレーは停止中");
    } else {
        NSLog(@"その他は順調");
    }
    
}

- (void) rangeOperationString : (NSString*) target condition:(NSArray*) conditionArray {
  
    NSLOG_METHOD
    for (NSString* condition in conditionArray) {
        if ([target containsString:condition])
        {
            NSLog(@"[%@]Found!!", condition);

        }
        else
        {
            NSLog(@"[%@]Not Found!!", condition);
        }
    }
    
}

- (void) rangeOperationForDouble : (double) startRange
                           end:(double) endRange
                     condition:(NSArray*) conditionArray {
    
    NSLOG_METHOD
    for (NSString* condition in conditionArray) {
        if (condition.doubleValue >= startRange && condition.doubleValue <= endRange)
        {
            NSLog(@"[%@]Found!!", condition);
            
        }
        else
        {
            NSLog(@"[%@]Not Found!!", condition);
        }
    }
    
}

- (void) forLoopChar {
    NSLOG_METHOD
    NSMutableString* message = [[NSMutableString alloc] initWithString:  @"おもてなし"];

    for (int i=0; i < [message length]; i++) {
        NSString *ichar  = [NSString stringWithFormat:@"%C", [message characterAtIndex:i]];

        NSLog(@"ichar =[%@]", ichar);
    }
}

- (void) repeatWhileLoopSample {
    
    NSLOG_METHOD
    //NSInteger a =0, b = 0, c=0, total=0;
    UInt32 a =0, b = 0, c=0, total=0;
    
    while(total != 21) {
        a = arc4random_uniform(13) + 1;
        b = arc4random_uniform(13) + 1;
        c = arc4random_uniform(13) + 1;
        
        total = a +b +c ;
    }
    
    NSLog(@"a[%ld],b[%ld],c[%ld],total[%ld] ", (long)a,(long)b,(long)c,(long)total);
}








@end
