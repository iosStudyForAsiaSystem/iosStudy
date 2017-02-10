//
//  ViewController.m
//  showHideForObjC
//
//  Created by snowman on 2017/02/10.
//  Copyright © 2017年 snowman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *flowerImgV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonAction:(UIButton *)sender {
    
    _flowerImgV.hidden = !_flowerImgV.hidden;
}


@end
