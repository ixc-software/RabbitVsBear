//
//  DataViewController.h
//  RabbitVsBear
//
//  Created by Oleksii Vynogradov on 3/29/12.
//  Copyright (c) 2012 IXC-USA Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class ModelController;

@interface DataViewController : UIViewController <AVAudioPlayerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;
@property (strong, nonatomic) ModelController *modelController;
@property (strong, nonatomic) NSMutableArray *allFlagsButtons;
@property (strong, nonatomic) AVAudioPlayer *theAudio;

@property (strong) NSNumber *currentSelectedFlagTag;
@property (strong) NSTimer *progressTimer;

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIButton *previousPage;
@property (weak, nonatomic) IBOutlet UIButton *nextPage;
@property (weak, nonatomic) IBOutlet UIButton *flagAE;
@property (weak, nonatomic) IBOutlet UIButton *flagDE;
@property (weak, nonatomic) IBOutlet UIButton *flagCN;
@property (weak, nonatomic) IBOutlet UIButton *flagSP;
@property (weak, nonatomic) IBOutlet UIButton *flagRUS;
@property (weak, nonatomic) IBOutlet UIButton *flagGB;
@property (weak, nonatomic) IBOutlet UIButton *flagUA;
@property (weak, nonatomic) IBOutlet UIButton *playStop;

@property (weak, nonatomic) IBOutlet UIView *buttonsView;

@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UITextView *finalTextInsideBox;
@property (weak, nonatomic) IBOutlet UIProgressView *playbackProgress;
@property (weak, nonatomic) IBOutlet UILabel *pageNumber;

@end
