//
//  RootViewController.h
//  RabbitVsBear
//
//  Created by Oleksii Vynogradov on 3/29/12.
//  Copyright (c) 2012 IXC-USA Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate,UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end
