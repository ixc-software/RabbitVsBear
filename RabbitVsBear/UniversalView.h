//
//  UniversalView.h
//  RabbitVsBear
//
//  Created by Oleksii Vynogradov on 4/8/12.
//  Copyright (c) 2012 IXC-USA Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UniversalView_DrawBlock)(UIView* v,CGContextRef context);


@interface UniversalView : UIView
@property (nonatomic,copy) UniversalView_DrawBlock drawBlock;

@end
