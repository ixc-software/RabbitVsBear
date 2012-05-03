//
//  UniversalView.m
//  RabbitVsBear
//
//  Created by Oleksii Vynogradov on 4/8/12.
//  Copyright (c) 2012 IXC-USA Corp. All rights reserved.
//

#import "UniversalView.h"

@implementation UniversalView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

@synthesize drawBlock;

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if(self.drawBlock)
        self.drawBlock(self,context);
}
@end
