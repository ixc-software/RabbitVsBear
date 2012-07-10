//
//  AVButton.h
//  RabbitVsBear
//
//  Created by Oleksii Vynogradov on 3/29/12.
//  Copyright (c) 2012 IXC-USA Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class DataViewController;

@interface AVImageView : UIImageView <AVAudioPlayerDelegate>{
    
    CGPoint offset;
    BOOL isScalled;
}
//-(CGPoint) calculatePositionForPoint:(CGPoint)location;

@property (strong, nonatomic) AVAudioPlayer *theAudio;

@property (strong, nonatomic) NSString *imageName;
//@property (strong, nonatomic) NSString *imageNumber;
@property (strong, nonatomic) DataViewController *dataViewController;

@end
