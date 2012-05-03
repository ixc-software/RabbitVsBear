//
//  AVButton.m
//  RabbitVsBear
//
//  Created by Oleksii Vynogradov on 3/29/12.
//  Copyright (c) 2012 IXC-USA Corp. All rights reserved.
//

#import "AVButton.h"

@implementation AVButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    // test if our control subview is on-screen
    NSLog(@"start checking..");
    if (self.superview != nil) {
        NSLog(@"superview not nil..");
        
        if ([touch.view isDescendantOfView:self] && self.hidden != YES) {
            // we touched our control surface
            NSLog(@"ignore the touch");
            
            return NO; // ignore the touch
        }
    }
    return YES; // handle the touch
}

@end
