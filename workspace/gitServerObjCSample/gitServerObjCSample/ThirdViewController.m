//
//  ThirdViewController.m
//  gitServerObjCSample
//
//  Created by snowman on 2017/02/10.
//  Copyright © 2017年 snowman. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //#1 string method sample
    [self stringMethod1];
    //#2 string Substract sample
    [self stringToSubstract];
    
    //#3 string compare sample
    [self compareStringSampel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void) stringMethod1
{
   NSArray* week = @[@"monday", @"tuesday", @"wendesday"];
    
    NSString* result = @"";
    for ( NSString * day in week) {
        result = [result stringByAppendingString:[NSString stringWithFormat:@"%@,",day]];
    }
    NSLog(@"result=%@", result);
}

- (void ) stringToSubstract  {
    
    
    NSString* str = @"swift beginer";
    NSString* startChar = [str substringWithRange:NSMakeRange(0, 1)];
    NSString* char2 = [str substringWithRange:NSMakeRange(1, 1)];
    NSString* char3 = [str substringWithRange:NSMakeRange([str length]-2, 1)];
    NSString* endChar = [str substringFromIndex:[str length]-1];
    
    NSLog(@"%@,%@,%@,%@,", startChar, char2,char3,endChar);
    
    
    
}


- (void) compareStringSampel {
    
    NSArray* testArr = @[@"composit",@"complex" , @"Zoo", @"multiflex"];
    
    for (NSString* item in testArr) {
        
        if( [item hasPrefix:@"co"]) {
            NSLog(@"item has prefix co: [%@]", item );
        } else if([item hasSuffix:@"ex"]) {
            NSLog(@"item  hasSuffix ex: [%@]", item );
        }
        
        NSRange range = [item rangeOfString:@"pos"];
        
        if(range.location < item.length -1) {
            NSLog(@"range location:[%lu] substring from index :%@",(unsigned long)range.location,
                  [item substringFromIndex:range.location]);
        }
    }
}



















@end
