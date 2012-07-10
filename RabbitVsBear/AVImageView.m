//
//  AVButton.m
//  RabbitVsBear
//
//  Created by Oleksii Vynogradov on 3/29/12.
//  Copyright (c) 2012 IXC-USA Corp. All rights reserved.
//

#import "AVImageView.h"
#import <QuartzCore/CoreAnimation.h>
#import "DataViewController.h"

@implementation AVImageView
@synthesize imageName,dataViewController,theAudio;

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

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
//    CGPoint pt = [[touches anyObject] locationInView:self.superview];
//    self.center = pt;
//    
//    self.clipsToBounds = NO;
//    self.animationImages = [NSArray arrayWithArray:cardAnimationArray];
//    [cardAnimationArray release];
//    [self setAnimationRepeatCount:1];
//    self.animationDuration= 1;
//    [self startAnimating];
//    self.image = [UIImage imageNamed:cardMovedImageName];
    
    UITouch *aTouch = [touches anyObject];
    //self.transform = CGAffineTransformScale(self.transform, 1.2, 1.2);
    CABasicAnimation *zoomOutMax = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    zoomOutMax.beginTime = CACurrentMediaTime();
    zoomOutMax.toValue = [NSNumber numberWithDouble:1.2];
    zoomOutMax.duration = 0.2;
    zoomOutMax.fillMode=kCAFillModeForwards;
    zoomOutMax.removedOnCompletion = NO;
    [self.layer addAnimation:zoomOutMax forKey:@"zoomOutMax"];

    CABasicAnimation *zoomOut = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    zoomOut.beginTime = CACurrentMediaTime()+0.2;
    zoomOut.toValue = [NSNumber numberWithDouble:1.1];
    zoomOut.duration = 0.2;
    zoomOut.fillMode=kCAFillModeForwards;
    zoomOut.removedOnCompletion=NO;
    [self.layer addAnimation:zoomOut forKey:@"zoomOut"];
    
    if (dataViewController.animalVoiceOnOff.on == YES) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^(void) {
            
            NSString *keyToGet = [NSString stringWithFormat:@"%@_voiceName",imageName];
            
            NSString *fileName = [dataViewController.dataObject valueForKey:keyToGet];
            
            NSString *language = nil;
            
            switch (dataViewController.currentSelectedFlagTag.integerValue) {
                case 0:
                    language = @"UA";
                    break;
                case 1:
                    language = @"CN";
                    break;
                case 2:
                    language = @"GB";
                    break;
                case 3:
                    language = @"SP";
                    break;
                case 4:
                    language = @"AE";
                    break;
                case 5:
                    language = @"RUS";
                    break;
                case 6:
                    language = @"DE";
                    break;
                    
                default:
                    break;
            }
            
            
            NSString *finalFileName = [NSString stringWithFormat:@"%@%@",fileName,language];
            
            NSURL *fileToPlay = [[NSBundle mainBundle] URLForResource:finalFileName withExtension:@"m4a"];
            NSError *error;
            
            self.theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:fileToPlay error:&error];  
            [self.theAudio prepareToPlay];
            [self.theAudio play];
            if (error) NSLog(@">>>>>>>>> error:%@",[error localizedDescription]);
        });
    }
    offset = [aTouch locationInView: self];
    //NSLog(@"touchesBegan");
    isScalled = NO;
}

-(CGPoint) calculatePositionForPoint:(CGPoint)location {
    
    return location;
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag;
{
    //NSLog(@">>>>>>>>> SUCCESS");
}

- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
//    self.clipsToBounds = NO;
//    CGPoint pt = [[touches anyObject] locationInView:self.superview];
//    CGRect frame = [self frame];
//    frame.origin.x += pt.x - self.center.x;
//    frame.origin.y += pt.y - self.center.y;
//    [self setFrame: frame];
    //NSLog(@"touchesMoved");
//    if (!isScalled) { 
//        CABasicAnimation *zoomOut = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//        zoomOut.beginTime = CACurrentMediaTime();
//        zoomOut.toValue = [NSNumber numberWithDouble:1.2];
//        zoomOut.duration = 0.2;
//        zoomOut.fillMode=kCAFillModeForwards;
//        zoomOut.removedOnCompletion=NO;
//        [self.layer addAnimation:zoomOut forKey:@"zoomOut"];
//        
//        //self.transform = CGAffineTransformScale(self.transform, 1.2, 1.2);
//        isScalled = YES;
//    }
    UITouch *aTouch = [touches anyObject];
    CGPoint location = [aTouch locationInView:self.superview];
    
    [UIView beginAnimations:@"Dragging A DraggableView" context:nil];
    self.frame = CGRectMake(location.x-offset.x, location.y-offset.y, 
                            self.frame.size.width, self.frame.size.height);
    [UIView commitAnimations];}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    // test if our control subview is on-screen
//    NSLog(@"start checking..");
//    if (self.superview != nil) {
//        NSLog(@"superview not nil..");
//        
//        if ([touch.view isDescendantOfView:self] && self.hidden != YES) {
//            // we touched our control surface
//            NSLog(@"ignore the touch");
//            
//            return NO; // ignore the touch
//        }
//    }
//    return YES; // handle the touch
//}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"touchesEnded");

    //self.transform = CGAffineTransformScale(self.transform, 1.0, 1.0);
    isScalled = NO;
    CABasicAnimation *zoomNormal = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //zoomNormal.beginTime = CACurrentMediaTime();
    zoomNormal.toValue = [NSNumber numberWithDouble:1.0];
    zoomNormal.duration = 0.1;
    zoomNormal.fillMode=kCAFillModeForwards;
    zoomNormal.removedOnCompletion=NO;
    [self.layer addAnimation:zoomNormal forKey:@"zoomNormal"];

}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"touchesCancelled");

    //self.transform = CGAffineTransformScale(self.transform, 1.0, 1.0);
    isScalled = NO;
    CABasicAnimation *zoomNormal = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //zoomNormal.beginTime = CACurrentMediaTime();
    zoomNormal.toValue = [NSNumber numberWithDouble:1.0];
    zoomNormal.duration = 0.1;
    zoomNormal.fillMode=kCAFillModeForwards;
    zoomNormal.removedOnCompletion=NO;
    [self.layer addAnimation:zoomNormal forKey:@"zoomNormal"];

}
@end
