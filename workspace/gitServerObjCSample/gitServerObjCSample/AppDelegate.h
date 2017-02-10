//
//  AppDelegate.h
//  gitServerObjCSample
//
//  Created by snowman on 2017/02/09.
//  Copyright © 2017年 snowman. All rights reserved.
//

#import <UIKit/UIKit.h>


#define NSLOG_METHOD  NSLog(@"====== %s:%d ", __func__, __LINE__);


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

