//
//  SecondViewController.m
//  gitServerObjCSample
//
//  Created by snowman on 2017/02/09.
//  Copyright © 2017年 snowman. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // #1 skip
    // #2 result return func sample
    NSDictionary* dic = [self testResult:90 sugaku:80 eigo:75];
    NSLog(@"testResult %@", dic);
    
    //#3 default param sample
    [self priceParam3:1 kosu:1 souryou:250];
    [self priceParam3:1 kosu:1 ];
    [self priceParam3:1 ];
    [self priceParam3];
    
    //#4 generic parameter sample
    [self makeTemplate:@"str"];
    [self makeTemplate:[NSNumber numberWithInt:1]];
    
    //#5  param with method sample
    [self callSelector:@selector(priceParam3)];
    
    //#6 skip
    //#7
    id result7_1 = [self makeMultifyList:2];
    id result7 = [self makeUpperCaseArray];
    NSLog(@"%@ ,%@", result7,result7_1);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSDictionary*) testResult:(long)kokugo
                      sugaku:(long)sugaku
                        eigo:(long)eigo
{
    
    NSLOG_METHOD
    long total = kokugo + sugaku + eigo;
    double ave = round( (total/3)*10 )/ 10 ;
    
    NSDictionary* dic =  @{@"total":[NSNumber numberWithInteger:  total] ,
                           @"ave":[NSNumber numberWithDouble:  ave]} ;
    
    return dic;
    

}



// 単価と人数を引数で指定して料金を計算する関数
-(long) priceParam3:(long) tanka kosu:(long)kosu souryou:(long)souryou
{
    NSLOG_METHOD
    return tanka * kosu + souryou;
}
-(long) priceParam3 {
    return [self priceParam3:1 kosu:1 souryou:250];
}
-(long) priceParam3:(long) tanka kosu:(long)kosu
{
    return [self priceParam3:tanka kosu:kosu souryou:250];
}
-(long) priceParam3:(long) tanka
{
    return [self priceParam3:tanka kosu:1 souryou:250];
}


- (NSArray*) makeTemplate:(id) value {
    
    NSDate* date = [NSDate date];
    return @[value, @"first Object",date];
}


- (void) callSelector:(SEL) sel
{
    NSLOG_METHOD
    if([self respondsToSelector:sel]) {
        [self performSelector:sel];
    }
}


- (void) callBlock {

    int anInteger = 42;

    void (^testBlock)(void) = ^{
        
        NSLog(@"Integer is: %d", anInteger);   // anInteger outside variables
        
    };

    // calling blocks like
    testBlock();
        
}

- (NSMutableArray*) makeMultifyList:(long) multifyNum {
    NSArray * targetArr = @[@"4", @"7",@"2", @"9"];
    
    NSMutableArray* resultArray = [[NSMutableArray alloc] init];
    for (NSString * string in targetArr) {
        [resultArray addObject:[NSString stringWithFormat:@"%ld", (long)( string.integerValue * multifyNum)]];
    }
    return resultArray;
}

- (NSMutableArray*) makeUpperCaseArray {
    NSArray * targetArr = @[@"red", @"blue",@"green"];
    
    NSMutableArray* resultArray = [[NSMutableArray alloc] init];
    for (NSString * string in targetArr) {
        [resultArray addObject:string.uppercaseString];
    }
    return resultArray;
}
















@end
