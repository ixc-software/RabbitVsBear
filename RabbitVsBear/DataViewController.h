//
//  DataViewController.h
//  RabbitVsBear
//
//  Created by Oleksii Vynogradov on 3/29/12.
//  Copyright (c) 2012 IXC-USA Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AVImageView.h"
@class ModelController;

@interface DataViewController : UIViewController <AVAudioPlayerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;
@property (strong, nonatomic) ModelController *modelController;
@property (strong, nonatomic) NSMutableArray *allFlagsButtons;
@property (strong, nonatomic) AVAudioPlayer *theAudio;

@property (strong) NSNumber *currentSelectedFlagTag;
@property (strong) NSTimer *progressTimer;

@property (nonatomic) IBOutlet UIImageView *image;
@property (nonatomic) IBOutlet UIImageView *imageBackground;
@property (nonatomic) IBOutlet UIButton *previousPage;
@property (nonatomic) IBOutlet UIButton *nextPage;
@property (nonatomic) IBOutlet UIButton *flagAE;
@property (nonatomic) IBOutlet UIButton *flagDE;
@property (nonatomic) IBOutlet UIButton *flagCN;
@property (nonatomic) IBOutlet UIButton *flagSP;
@property (nonatomic) IBOutlet UIButton *flagRUS;
@property (nonatomic) IBOutlet UIButton *flagGB;
@property (nonatomic) IBOutlet UIButton *flagUA;
@property (nonatomic) IBOutlet UIButton *playStop;

@property (nonatomic) IBOutlet UIView *buttonsView;

@property (nonatomic) IBOutlet UITextView *text;
@property (nonatomic) IBOutlet UITextView *finalTextInsideBox;
@property (nonatomic) IBOutlet UIProgressView *playbackProgress;
@property (nonatomic) IBOutlet UILabel *pageNumber;
@property (weak, nonatomic) IBOutlet AVImageView *image1;
@property (weak, nonatomic) IBOutlet AVImageView *image2;
@property (weak, nonatomic) IBOutlet AVImageView *image3;
@property (weak, nonatomic) IBOutlet AVImageView *image4;
@property (weak, nonatomic) IBOutlet AVImageView *image5;
@property (weak, nonatomic) IBOutlet AVImageView *image6;
@property (weak, nonatomic) IBOutlet AVImageView *image7;
@property (weak, nonatomic) IBOutlet UILabel *animalVoice;
@property (weak, nonatomic) IBOutlet UISwitch *animalVoiceOnOff;
@property (weak, nonatomic) IBOutlet UIButton *previousPageButton;
@property (weak, nonatomic) IBOutlet UIButton *nextPageButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *downloadingProgress;

@end
