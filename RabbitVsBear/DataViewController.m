//
//  DataViewController.m
//  RabbitVsBear
//
//  Created by Oleksii Vynogradov on 3/29/12.
//  Copyright (c) 2012 IXC-USA Corp. All rights reserved.
//

#import "DataViewController.h"
#import "ModelController.h"
#import "RootViewController.h"
#import "UniversalView.h"
#import <QuartzCore/CoreAnimation.h>
#import "AppDelegate.h"

@interface DataViewController ()
-(void) startAnimationForFlagsForSelectedTag:(NSInteger)selectedTag forFirstStart:(BOOL)isFirstStart;

@property (assign) BOOL isFlagsVisible;
@property (assign) CGRect flag1frame;
@property (assign) CGRect flag2frame;
@property (assign) CGRect flag3frame;
@property (assign) CGRect flag4frame;
@property (assign) CGRect flag5frame;
@property (assign) CGRect flag6frame;
@property (assign) CGRect flag7frame;

@end

@implementation DataViewController

@synthesize dataLabel = _dataLabel;
@synthesize dataObject = _dataObject;
@synthesize image = _image;
@synthesize imageBackground = _imageBackground;
@synthesize previousPage = _previousPage;
@synthesize nextPage = _nextPage;
@synthesize flagAE = _flag1;
@synthesize flagDE = _flag2;
@synthesize flagCN = _flag3;
@synthesize flagSP = _flag4;
@synthesize flagRUS = _flag5;
@synthesize flagGB = _flag6;
@synthesize flagUA = _flag7;
@synthesize playStop = _playStop;
@synthesize buttonsView = _buttonsView;
@synthesize text = _text;
@synthesize finalTextInsideBox = _finalTextInsideBox;
@synthesize playbackProgress = _playbabkProgress;
@synthesize pageNumber = _pageNumber;
@synthesize image1 = _bear;
@synthesize image2 = _rabbit;
@synthesize image3 = _kuznechik;
@synthesize image4 = _belka;
@synthesize image5 = _ptica;
@synthesize image6 = _image6;
@synthesize image7 = _image7;
@synthesize nextPageButton = _nextPageButton;
@synthesize animalVoice = _animalVoice;
@synthesize animalVoiceOnOff = _animalVoiceOnOff;
@synthesize previousPageButton = _previousPageButton;
@synthesize modelController = _modelController;
@synthesize isFlagsVisible,flag1frame,flag2frame,flag3frame,flag4frame,flag5frame,flag6frame,flag7frame;
@synthesize allFlagsButtons = _allFlagsButtons;
@synthesize currentSelectedFlagTag = _currentSelectedFlagTag;
@synthesize theAudio = _theAudio;
@synthesize progressTimer = _progressTimer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    isFlagsVisible = NO;
    flag1frame = self.flagAE.frame;
    flag2frame = self.flagDE.frame;
    flag3frame = self.flagCN.frame;
    flag4frame = self.flagSP.frame;
    flag5frame = self.flagRUS.frame;
    flag6frame = self.flagGB.frame;
    flag7frame = self.flagUA.frame;
    
    self.image1.imageName = @"image1";
    self.image2.imageName = @"image2";
    self.image3.imageName = @"image3";
    self.image4.imageName = @"image4";
    self.image5.imageName = @"image5";
    self.image6.imageName = @"image6";
    self.image7.imageName = @"image7";
    self.image1.dataViewController = self;
    self.image2.dataViewController = self;
    self.image3.dataViewController = self;
    self.image4.dataViewController = self;
    self.image5.dataViewController = self;
    self.image6.dataViewController = self;
    self.image7.dataViewController = self;
    
    
    self.allFlagsButtons = [[NSMutableArray alloc] initWithObjects:self.flagUA,self.flagCN,self.flagGB,self.flagSP,self.flagAE,self.flagRUS,self.flagDE, nil];
//    self.text.layer.shadowOpacity=0.8;
//    self.text.layer.shadowColor=[[UIColor blackColor] CGColor];
//    self.text.layer.shadowOffset=CGSizeMake(0, 0);
//    self.text.layer.shadowRadius=10;
    self.text.layer.cornerRadius=10;
    self.text.layer.borderWidth = 1;
    self.text.layer.borderColor = [[UIColor colorWithRed:0.24 green:0.49 blue:0.18 alpha:1.0] CGColor];
    
    self.text.layer.cornerRadius = 15;
    
    self.text.clipsToBounds = YES;
    //NSLog(@"viewDidLoad: data for page:%@",self.dataObject);


}

- (void)viewDidUnload
{
    [self setImage:nil];
    [self setPreviousPage:nil];
    [self setNextPage:nil];
    [self setFlagAE:nil];
    [self setFlagDE:nil];
    [self setFlagCN:nil];
    [self setFlagSP:nil];
    [self setFlagRUS:nil];
    [self setPlayStop:nil];
    [self setButtonsView:nil];
    [self setText:nil];
    [self setPlaybackProgress:nil];
    [self setFinalTextInsideBox:nil];
    [self setPageNumber:nil];
    [self setImageBackground:nil];
    [self setImage1:nil];
    [self setImage2:nil];
    [self setImage3:nil];
    [self setImage4:nil];
    [self setImage5:nil];
    [self setImage6:nil];
    [self setImage7:nil];
    [self setAnimalVoice:nil];
    [self setAnimalVoiceOnOff:nil];
    [self setPreviousPageButton:nil];
    [self setNextPageButton:nil];
    [self setDownloadingProgress:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.dataLabel = nil;
    
}

- (void)prepareAllImagesForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
{
    NSDictionary *dataForPage = self.dataObject;
    //NSLog(@"data for page:%@",dataForPage);
    
    UIImage *imageLandscape = nil;
    UIImage *imagePortrait = nil;
    
    UIImage *imageLandscapeBackground = nil;
    UIImage *imagePortraitBackground = nil;
    BOOL isRethina = NO;
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] &&
        ([UIScreen mainScreen].scale == 2.0)) {
        // Retina display
        isRethina = YES;
    } else {
        // non-Retina display
    }
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];

    UIFont *currentFont = self.finalTextInsideBox.font;
    NSString *page = [self.dataObject valueForKey:@"page"];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *pageNumber = [formatter numberFromString:page];

    if (![[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ) {
        NSString *imageLandscapeName = [dataForPage valueForKey:@"image_IPhone_Landscape"];
        NSString *imagePortraitName = [dataForPage valueForKey:@"image_IPhone_Portrait"];
        if (pageNumber.intValue < 3) {
            if (isRethina) {
                imageLandscapeName = [imageLandscapeName stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageLandscapeName]];
                if (image1new) imageLandscape = image1new; else imageLandscape = [UIImage imageNamed:[dataForPage valueForKey:@"image_IPhone_Landscape"]];
            } else imageLandscape = [UIImage imageNamed:imageLandscapeName];
            if (isRethina) {
                imagePortraitName = [imagePortraitName stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imagePortraitName]];
                if (image1new) imagePortrait = image1new; else imagePortrait = [UIImage imageNamed:[dataForPage valueForKey:@"image_IPhone_Portrait"]];
            } else imagePortrait = [UIImage imageNamed:imagePortraitName];
        } else {
            imageLandscape = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageLandscapeName]];
            if (isRethina) {
                imageLandscapeName = [imageLandscapeName stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageLandscapeName]];
                if (image1new) imageLandscape = image1new;
            }
            imagePortrait = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imagePortraitName]];
            if (isRethina) {
                imagePortraitName = [imagePortraitName stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imagePortraitName]];
                if (image1new) imagePortrait = image1new; 
            } 
        }

        self.finalTextInsideBox.font = [UIFont fontWithName:currentFont.fontName size:14.0];
        imageLandscapeBackground = [UIImage imageNamed:@"page00GIPhone.png"];
        imagePortraitBackground = [UIImage imageNamed:@"page00VIPhone.png"];
    } else {
        NSString *imageLandscapeName = [dataForPage valueForKey:@"image_IPad_Landscape"];
        NSString *imagePortraitName = [dataForPage valueForKey:@"image_IPad_Portrait"];
        if (pageNumber.intValue < 3) {
            if (isRethina) {
                imageLandscapeName = [imageLandscapeName stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageLandscapeName]];
                if (image1new) imageLandscape = image1new;else imageLandscape = [UIImage imageNamed:imageLandscapeName];
            } else imageLandscape = [UIImage imageNamed:[dataForPage valueForKey:@"image_IPad_Landscape"]];
            if (isRethina) {
                imagePortraitName = [imagePortraitName stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imagePortraitName]];
                if (image1new) imagePortrait = image1new;else imagePortrait = [UIImage imageNamed:[dataForPage valueForKey:@"image_IPad_Portrait"]];
            } else imagePortrait = [UIImage imageNamed:imagePortraitName];
        } else {
            imageLandscape = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageLandscapeName]];
            if (isRethina) {
                imageLandscapeName = [imageLandscapeName stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageLandscapeName]];
                if (image1new) imageLandscape = image1new;
            }
            imagePortrait = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imagePortraitName]];
            if (isRethina) {
                imagePortraitName = [imagePortraitName stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imagePortraitName]];
                if (image1new) imagePortrait = image1new;
            } 
        }
        //imageLandscape = [dataForPage valueForKey:@"image_IPad_Landscape"];
        //imagePortrait = [dataForPage valueForKey:@"image_IPad_Portrait"];
        self.finalTextInsideBox.font = [UIFont fontWithName:currentFont.fontName size:24.0];
        imageLandscapeBackground = [UIImage imageNamed:@"page00GIPad.png"];
        imagePortraitBackground = [UIImage imageNamed:@"page00VIPad.png"];
    }
    
    //[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"currentSelectedFlagTag"];
    
    self.currentSelectedFlagTag = [[NSUserDefaults standardUserDefaults] valueForKey:@"currentSelectedFlagTag"];
    
    //UIInterfaceOrientation currentOrientation = self.interfaceOrientation;
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) { 
        [self.image setImage:imageLandscape];
        [self.imageBackground setImage:imageLandscapeBackground];
        //NSLog(@"frame of image Landscape:%@",NSStringFromCGRect(self.image.frame));
        if (![[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ) {
            //iPhone Gorizontal/ Landcape
            self.playStop.frame = CGRectMake(384, 45, self.playStop.frame.size.width, self.playStop.frame.size.height);
            self.playbackProgress.frame = CGRectMake(384, 36, self.playbackProgress.frame.size.width, self.playbackProgress.frame.size.height);
            self.buttonsView.frame = CGRectMake(317, 165, self.buttonsView.frame.size.width, self.buttonsView.frame.size.height);
            self.text.frame = CGRectMake(7, 223, 305, 70);
            self.finalTextInsideBox.frame = CGRectMake(15, 223, 275, 70);
            self.pageNumber.frame = CGRectMake(49, 9, self.pageNumber.frame.size.width, self.pageNumber.frame.size.height);
            self.animalVoiceOnOff.frame = CGRectMake(381, 130, self.animalVoiceOnOff.frame.size.width, self.animalVoiceOnOff.frame.size.height);
            self.animalVoice.frame = CGRectMake(373, 113, self.animalVoice.frame.size.width, self.animalVoice.frame.size.height);
            self.previousPageButton.frame = CGRectMake(0, 0, self.previousPageButton.frame.size.width, self.previousPageButton.frame.size.height);
            self.nextPageButton.frame = CGRectMake(434, 0, self.nextPageButton.frame.size.width, self.nextPageButton.frame.size.height);
            self.downloadingProgress.frame = CGRectMake(436, 0, self.downloadingProgress.frame.size.width, self.downloadingProgress.frame.size.height);
            NSString *imageName1 = [dataForPage valueForKey:@"image1_IPhone_Landscape"];
            UIImage *image1 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName1]];;
            if (isRethina) {
                imageName1 = [imageName1 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName1]];
                if (image1new) image1 = image1new;
            } 
            if (pageNumber.intValue < 3) image1 = [UIImage imageNamed:[dataForPage valueForKey:@"image1_IPhone_Landscape"]];

            CGRect image1Frame = CGRectFromString([dataForPage valueForKey:@"image1_IPhone_Landscape_Point"]);
            self.image1.image = image1;
            self.image1.frame = image1Frame;
            //UIImage *image2 = [dataForPage valueForKey:@"image2_IPhone_Landscape"];;
            NSString *imageName2 = [dataForPage valueForKey:@"image2_IPhone_Landscape"];
            UIImage *image2 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName2]];;
            if (isRethina) {
                imageName2 = [imageName2 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName2]];
                if (image1new) image2 = image1new;
            } 
            if (pageNumber.intValue < 3) image2 = [UIImage imageNamed:[dataForPage valueForKey:@"image2_IPhone_Landscape"]];

            CGRect image2Frame = CGRectFromString([dataForPage valueForKey:@"image2_IPhone_Landscape_Point"]);
            self.image2.image = image2;
            self.image2.frame = image2Frame;
            
            //UIImage *image3 = [dataForPage valueForKey:@"image3_IPhone_Landscape"];;
            NSString *imageName3 = [dataForPage valueForKey:@"image3_IPhone_Landscape"];
            UIImage *image3 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName3]];;
            if (isRethina) {
                imageName3 = [imageName3 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName3]];
                if (image1new) image3 = image1new;
            } 
            if (pageNumber.intValue < 3) image3 = [UIImage imageNamed:[dataForPage valueForKey:@"image3_IPhone_Landscape"]];

            CGRect image3Frame = CGRectFromString([dataForPage valueForKey:@"image3_IPhone_Landscape_Point"]);
            self.image3.image = image3;
            self.image3.frame = image3Frame;
            
            //UIImage *image4 = [dataForPage valueForKey:@"image4_IPhone_Landscape"];;
            NSString *imageName4 = [dataForPage valueForKey:@"image4_IPhone_Landscape"];
            UIImage *image4 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName4]];;
            if (isRethina) {
                imageName4 = [imageName4 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName4]];
                if (image1new) image4 = image1new;
            } 

            CGRect image4Frame = CGRectFromString([dataForPage valueForKey:@"image4_IPhone_Landscape_Point"]);
            self.image4.image = image4;
            self.image4.frame = image4Frame;
            
            //UIImage *image5 = [dataForPage valueForKey:@"image5_IPhone_Landscape"];;
            NSString *imageName5 = [dataForPage valueForKey:@"image5_IPhone_Landscape"];
            UIImage *image5 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName5]];;
            if (isRethina) {
                imageName5 = [imageName5 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName5]];
                if (image1new) image5 = image1new; 
            } 
            CGRect image5Frame = CGRectFromString([dataForPage valueForKey:@"image5_IPhone_Landscape_Point"]);
            self.image5.image = image5;
            self.image5.frame = image5Frame;
            
            //UIImage *image6 = [dataForPage valueForKey:@"image6_IPhone_Landscape"];;
            NSString *imageName6 = [dataForPage valueForKey:@"image6_IPhone_Landscape"];
            UIImage *image6 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName6]];;
            if (isRethina) {
                imageName6 = [imageName6 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName6]];
                if (image1new) image6 = image1new; 
            } 
            CGRect image6Frame = CGRectFromString([dataForPage valueForKey:@"image6_IPhone_Landscape_Point"]);
            self.image6.image = image6;
            self.image6.frame = image6Frame;
            //UIImage *image7 = [dataForPage valueForKey:@"image7_IPhone_Landscape"];;
            NSString *imageName7 = [dataForPage valueForKey:@"image7_IPhone_Landscape"];
            UIImage *image7 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName7]];;
            if (isRethina) {
                imageName7 = [imageName7 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName7]];
                if (image1new) image7 = image1new; 
            } 
            CGRect image7Frame = CGRectFromString([dataForPage valueForKey:@"image7_IPhone_Landscape_Point"]);
            self.image7.image = image7;
            self.image7.frame = image7Frame;
        } else {
            // iPad Gorizontal
            self.playStop.frame = CGRectMake(888, 370, self.playStop.frame.size.width, self.playStop.frame.size.height);
            self.playbackProgress.frame = CGRectMake(888, 450, self.playbackProgress.frame.size.width, self.playbackProgress.frame.size.height);
            self.buttonsView.frame = CGRectMake(763, 487, self.buttonsView.frame.size.width, self.buttonsView.frame.size.height);
            self.text.frame = CGRectMake(20, 573, 735, 155);
            self.finalTextInsideBox.frame = CGRectMake(35, 586, 703, 126);
            self.pageNumber.frame = CGRectMake(108, 27, self.pageNumber.frame.size.width, self.pageNumber.frame.size.height);
            self.animalVoiceOnOff.frame = CGRectMake(885, 335, self.animalVoiceOnOff.frame.size.width, self.animalVoiceOnOff.frame.size.height);
            self.animalVoice.frame = CGRectMake(845, 305, self.animalVoice.frame.size.width, self.animalVoice.frame.size.height);
            
            self.previousPageButton.frame = CGRectMake(20, 7, self.previousPageButton.frame.size.width, self.previousPageButton.frame.size.height);
            self.nextPageButton.frame = CGRectMake(917, 7, self.nextPageButton.frame.size.width, self.nextPageButton.frame.size.height);
            self.downloadingProgress.frame = CGRectMake(939, 27, self.downloadingProgress.frame.size.width, self.downloadingProgress.frame.size.height);
            
            //UIImage *image1 = [dataForPage valueForKey:@"image1_IPad_Landscape"];;
            NSString *imageName1 = [dataForPage valueForKey:@"image1_IPad_Landscape"];
            UIImage *image1 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName1]];;
            if (isRethina) {
                imageName1 = [imageName1 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName1]];
                if (image1new) image1 = image1new;
            }
            if (pageNumber.intValue < 3) image1 = [UIImage imageNamed:[dataForPage valueForKey:@"image1_IPad_Landscape"]];

            CGRect image1Frame = CGRectFromString([dataForPage valueForKey:@"image1_IPad_Landscape_Point"]);
            self.image1.image = image1;
            self.image1.frame = image1Frame;
            //UIImage *image2 = [dataForPage valueForKey:@"image2_IPad_Landscape"];
            NSString *imageName2 = [dataForPage valueForKey:@"image2_IPad_Landscape"];
            UIImage *image2 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName2]];;
            if (isRethina) {
                imageName2 = [imageName2 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName2]];
                if (image1new) image2 = image1new;
            }
            if (pageNumber.intValue < 3) image2 = [UIImage imageNamed:[dataForPage valueForKey:@"image2_IPad_Landscape"]];

            CGRect image2Frame = CGRectFromString([dataForPage valueForKey:@"image2_IPad_Landscape_Point"]);
            self.image2.image = image2;
            self.image2.frame = image2Frame;
            //UIImage *image3 = [dataForPage valueForKey:@"image3_IPad_Landscape"];;
            NSString *imageName3 = [dataForPage valueForKey:@"image3_IPad_Landscape"];
            UIImage *image3 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName3]];;
            if (isRethina) {
                imageName3 = [imageName3 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName3]];
                if (image1new) image3 = image1new;
            }
            if (pageNumber.intValue < 3) image3 = [UIImage imageNamed:[dataForPage valueForKey:@"image3_IPad_Landscape"]];

            CGRect image3Frame = CGRectFromString([dataForPage valueForKey:@"image3_IPad_Landscape_Point"]);
            self.image3.image = image3;
            self.image3.frame = image3Frame;
            
            //UIImage *image4 = [dataForPage valueForKey:@"image4_IPad_Landscape"];;
            NSString *imageName4 = [dataForPage valueForKey:@"image4_IPad_Landscape"];
            UIImage *image4 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName4]];;
            if (isRethina) {
                imageName4 = [imageName4 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName4]];
                if (image1new) image4 = image1new;
            } 
            CGRect image4Frame = CGRectFromString([dataForPage valueForKey:@"image4_IPad_Landscape_Point"]);
            self.image4.image = image4;
            self.image4.frame = image4Frame;
            
            //UIImage *image5 = [dataForPage valueForKey:@"image5_IPad_Landscape"];;
            NSString *imageName5 = [dataForPage valueForKey:@"image5_IPad_Landscape"];
            UIImage *image5 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName5]];;
            if (isRethina) {
                imageName5 = [imageName5 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName5]];
                if (image1new) image5 = image1new; 
            } 
            CGRect image5Frame = CGRectFromString([dataForPage valueForKey:@"image5_IPad_Landscape_Point"]);
            self.image5.image = image5;
            self.image5.frame = image5Frame;
            
            //UIImage *image6 = [dataForPage valueForKey:@"image6_IPad_Landscape"];;
            NSString *imageName6 = [dataForPage valueForKey:@"image6_IPad_Landscape"];
            UIImage *image6 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName6]];;
            if (isRethina) {
                imageName6 = [imageName6 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName6]];
                if (image1new) image6 = image1new; 
            } 
            CGRect image6Frame = CGRectFromString([dataForPage valueForKey:@"image6_IPad_Landscape_Point"]);
            self.image6.image = image6;
            self.image6.frame = image6Frame;
            
            //UIImage *image7 = [dataForPage valueForKey:@"image7_IPad_Landscape"];;
            NSString *imageName7 = [dataForPage valueForKey:@"image7_IPad_Landscape"];
            UIImage *image7 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName7]];;
            if (isRethina) {
                imageName7 = [imageName7 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName7]];
                if (image1new) image7 = image1new; 
            } 

            CGRect image7Frame = CGRectFromString([dataForPage valueForKey:@"image7_IPad_Landscape_Point"]);
            self.image7.image = image7;
            self.image7.frame = image7Frame;

        }

    }
    else { 
        [self.imageBackground setImage:imagePortraitBackground];
        [self.image setImage:imagePortrait];
        
        if (![[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ) {
            //iPhone Vertical/Portrailt
            
            self.playStop.frame = CGRectMake(236, 195, self.playStop.frame.size.width, self.playStop.frame.size.height);
            self.playbackProgress.frame = CGRectMake(236, 184, self.playbackProgress.frame.size.width, self.playbackProgress.frame.size.height);
            self.buttonsView.frame = CGRectMake(163, 282, self.buttonsView.frame.size.width, self.buttonsView.frame.size.height);
            self.text.frame = CGRectMake(6, 282, 163, 135);
            self.finalTextInsideBox.frame = CGRectMake(13, 288, 156, 129);
            self.pageNumber.frame = CGRectMake(146, 432, self.pageNumber.frame.size.width, self.pageNumber.frame.size.height);
            self.animalVoiceOnOff.frame = CGRectMake(52, 430, self.animalVoiceOnOff.frame.size.width, self.animalVoiceOnOff.frame.size.height);
            self.animalVoice.frame = CGRectMake(44, 413, self.animalVoice.frame.size.width, self.animalVoice.frame.size.height);
            self.previousPageButton.frame = CGRectMake(0, 423, self.previousPageButton.frame.size.width, self.previousPageButton.frame.size.height);
            self.nextPageButton.frame = CGRectMake(273, 423, self.nextPageButton.frame.size.width, self.nextPageButton.frame.size.height);
            self.downloadingProgress.frame = CGRectMake(275, 423, self.downloadingProgress.frame.size.width, self.downloadingProgress.frame.size.height);

            // prepare images for animals:
           // UIImage *image1 = [dataForPage valueForKey:@"image1_IPhone_Portrait"];;
            //UIImage *image1 = [dataForPage valueForKey:@"image1_IPhone_Portrait"];;
            NSString *imageName1 = [dataForPage valueForKey:@"image1_IPhone_Portrait"];
            UIImage *image1 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName1]];;
            if (isRethina) {
                imageName1 = [imageName1 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName1]];
                if (image1new) image1 = image1new;
            } 
            if (pageNumber.intValue < 3) image1 = [UIImage imageNamed:[dataForPage valueForKey:@"image1_IPhone_Portrait"]];

            CGRect image1Frame = CGRectFromString([dataForPage valueForKey:@"image1_IPhone_Portrait_Point"]);
            self.image1.image = image1;
            self.image1.frame = image1Frame;
            
            //UIImage *image2 = [dataForPage valueForKey:@"image2_IPhone_Portrait"];;
            NSString *imageName2 = [dataForPage valueForKey:@"image2_IPhone_Portrait"];
            UIImage *image2 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName2]];;
            if (isRethina) {
                imageName2 = [imageName2 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName2]];
                if (image1new) image2 = image1new;
            }
            if (pageNumber.intValue < 3) image2 = [UIImage imageNamed:[dataForPage valueForKey:@"image2_IPhone_Portrait"]];

            CGRect image2Frame = CGRectFromString([dataForPage valueForKey:@"image2_IPhone_Portrait_Point"]);
            self.image2.image = image2;
            self.image2.frame = image2Frame;
            
            //UIImage *image3 = [dataForPage valueForKey:@"image3_IPhone_Portrait"];;
            NSString *imageName3 = [dataForPage valueForKey:@"image3_IPhone_Portrait"];
            UIImage *image3 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName3]];
            //NSLog(@"imageName3->%@",imageName3);
            if (isRethina) {
                imageName3 = [imageName3 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                //NSLog(@"imageName3->%@",imageName3);
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName3]];
                if (image1new) image3 = image1new;
            }
            if (pageNumber.intValue < 3) image3 = [UIImage imageNamed:[dataForPage valueForKey:@"image3_IPhone_Portrait"]];

            CGRect image3Frame = CGRectFromString([dataForPage valueForKey:@"image3_IPhone_Portrait_Point"]);
            self.image3.image = image3;
            self.image3.frame = image3Frame;
            
            //UIImage *image4 = [dataForPage valueForKey:@"image4_IPhone_Portrait"];;
            NSString *imageName4 = [dataForPage valueForKey:@"image4_IPhone_Portrait"];
            UIImage *image4 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName4]];;
            if (isRethina) {
                imageName4 = [imageName4 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName4]];
                if (image1new) image4 = image1new;
            } 

            CGRect image4Frame = CGRectFromString([dataForPage valueForKey:@"image4_IPhone_Portrait_Point"]);
            self.image4.image = image4;
            self.image4.frame = image4Frame;
            
            //UIImage *image5 = [dataForPage valueForKey:@"image5_IPhone_Portrait"];;
            NSString *imageName5 = [dataForPage valueForKey:@"image5_IPhone_Portrait"];
            UIImage *image5 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName5]];;
            if (isRethina) {
                imageName5 = [imageName5 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName5]];
                if (image1new) image5 = image1new; 
            } 

            CGRect image5Frame = CGRectFromString([dataForPage valueForKey:@"image5_IPhone_Portrait_Point"]);
            self.image5.image = image5;
            self.image5.frame = image5Frame;
            
            //UIImage *image6 = [dataForPage valueForKey:@"image6_IPhone_Portrait"];;
            NSString *imageName6 = [dataForPage valueForKey:@"image6_IPhone_Portrait"];
            UIImage *image6 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName6]];;
            if (isRethina) {
                imageName6 = [imageName6 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName6]];
                if (image1new) image6 = image1new; 
            } 
            CGRect image6Frame = CGRectFromString([dataForPage valueForKey:@"image6_IPhone_Portrait_Point"]);
            self.image6.image = image6;
            self.image6.frame = image6Frame;
            
            //UIImage *image7 = [dataForPage valueForKey:@"image7_IPhone_Portrait"];;
            NSString *imageName7 = [dataForPage valueForKey:@"image7_IPhone_Portrait"];
            UIImage *image7 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName7]];;
            if (isRethina) {
                imageName7 = [imageName7 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName7]];
                if (image1new) image7 = image1new; 
            } 

            CGRect image7Frame = CGRectFromString([dataForPage valueForKey:@"image7_IPhone_Portrait_Point"]);
            self.image7.image = image7;
            self.image7.frame = image7Frame;

            

        } else {
            //iPad Vertical
            self.playStop.frame = CGRectMake(619, 543, self.playStop.frame.size.width, self.playStop.frame.size.height);
            self.playbackProgress.frame = CGRectMake(619, 623, self.playbackProgress.frame.size.width, self.playbackProgress.frame.size.height);
            self.buttonsView.frame = CGRectMake(507, 666, self.buttonsView.frame.size.width, self.buttonsView.frame.size.height);
            self.text.frame = CGRectMake(20, 666, 479, 241);
            self.finalTextInsideBox.frame = CGRectMake(45, 679, 443, 228);
            self.pageNumber.frame = CGRectMake(280, 929, self.pageNumber.frame.size.width, self.pageNumber.frame.size.height);
            self.animalVoiceOnOff.frame = CGRectMake(148, 959, self.animalVoiceOnOff.frame.size.width, self.animalVoiceOnOff.frame.size.height);
            self.animalVoice.frame = CGRectMake(108, 929, self.animalVoice.frame.size.width, self.animalVoice.frame.size.height);
            
            self.previousPageButton.frame = CGRectMake(7, 918, self.previousPageButton.frame.size.width, self.previousPageButton.frame.size.height);
            self.nextPageButton.frame = CGRectMake(674, 918, self.nextPageButton.frame.size.width, self.nextPageButton.frame.size.height);
            self.downloadingProgress.frame = CGRectMake(696, 939, self.downloadingProgress.frame.size.width, self.downloadingProgress.frame.size.height);
            
            //UIImage *image1 = [dataForPage valueForKey:@"image1_IPad_Portrait"];
            NSString *imageName1 = [dataForPage valueForKey:@"image1_IPad_Portrait"];
            UIImage *image1 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName1]];;
            if (isRethina) {
                imageName1 = [imageName1 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName1]];
                if (image1new) image1 = image1new;
            }
            if (pageNumber.intValue < 3) image1 = [UIImage imageNamed:[dataForPage valueForKey:@"image1_IPad_Portrait"]];

            CGRect image1Frame = CGRectFromString([dataForPage valueForKey:@"image1_IPad_Portrait_Point"]);
            self.image1.image = image1;
            self.image1.frame = image1Frame;
            
            //UIImage *image2 = [dataForPage valueForKey:@"image2_IPad_Portrait"];
            NSString *imageName2 = [dataForPage valueForKey:@"image2_IPad_Portrait"];
            UIImage *image2 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName2]];;
            if (isRethina) {
                imageName2 = [imageName2 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName2]];
                if (image1new) image2 = image1new;
            } 
            if (pageNumber.intValue < 3) image2 = [UIImage imageNamed:[dataForPage valueForKey:@"image2_IPad_Portrait"]];

            CGRect image2Frame = CGRectFromString([dataForPage valueForKey:@"image2_IPad_Portrait_Point"]);
            self.image2.image = image2;
            self.image2.frame = image2Frame;
            
            //UIImage *image3 = [dataForPage valueForKey:@"image3_IPad_Portrait"];
            NSString *imageName3 = [dataForPage valueForKey:@"image3_IPad_Portrait"];
            UIImage *image3 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName3]];;
            if (isRethina) {
                imageName3 = [imageName3 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName3]];
                if (image1new) image3 = image1new;
            }
            if (pageNumber.intValue < 3) image3 = [UIImage imageNamed:[dataForPage valueForKey:@"image3_IPad_Portrait"]];

            CGRect image3Frame = CGRectFromString([dataForPage valueForKey:@"image3_IPad_Portrait_Point"]);
            self.image3.image = image3;
            self.image3.frame = image3Frame;
            
            //UIImage *image4 = [dataForPage valueForKey:@"image4_IPad_Portrait"];
            NSString *imageName4 = [dataForPage valueForKey:@"image4_IPad_Portrait"];
            UIImage *image4 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName4]];;
            if (isRethina) {
                imageName4 = [imageName4 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName4]];
                if (image1new) image4 = image1new;
            } 
            CGRect image4Frame = CGRectFromString([dataForPage valueForKey:@"image4_IPad_Portrait_Point"]);
            self.image4.image = image4;
            self.image4.frame = image4Frame;
            
            //UIImage *image5 = [dataForPage valueForKey:@"image5_IPad_Portrait"];
            NSString *imageName5 = [dataForPage valueForKey:@"image5_IPad_Portrait"];
            UIImage *image5 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName5]];;
            if (isRethina) {
                imageName5 = [imageName5 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName5]];
                if (image1new) image5 = image1new; 
            } 
            CGRect image5Frame = CGRectFromString([dataForPage valueForKey:@"image5_IPad_Portrait_Point"]);
            self.image5.image = image5;
            self.image5.frame = image5Frame;
            
            //UIImage *image6 = [dataForPage valueForKey:@"image6_IPad_Portrait"];
            NSString *imageName6 = [dataForPage valueForKey:@"image6_IPad_Portrait"];
            UIImage *image6 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName6]];;
            if (isRethina) {
                imageName6 = [imageName6 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName6]];
                if (image1new) image6 = image1new; 
            } 
            CGRect image6Frame = CGRectFromString([dataForPage valueForKey:@"image6_IPad_Portrait_Point"]);
            self.image6.image = image6;
            self.image6.frame = image6Frame;
            
            //UIImage *image7 = [dataForPage valueForKey:@"image7_IPad_Portrait"];
            NSString *imageName7 = [dataForPage valueForKey:@"image7_IPad_Portrait"];
            UIImage *image7 = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName7]];;
            if (isRethina) {
                imageName7 = [imageName7 stringByReplacingOccurrencesOfString:@".png" withString:@"@2x.png"];
                UIImage *image1new = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",documentsDirectory,imageName7]];
                if (image1new) image7 = image1new; 
            } 
            CGRect image7Frame = CGRectFromString([dataForPage valueForKey:@"image7_IPad_Portrait_Point"]);
            self.image7.image = image7;
            self.image7.frame = image7Frame;

        }

        //NSLog(@"frame of imageBackground:%@",NSStringFromCGRect(self.imageBackground.frame));
        //NSLog(@"frame of image:%@",NSStringFromCGRect(self.image.frame));
        
    }

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //self.dataLabel.text = [self.dataObject description];
    [self prepareAllImagesForInterfaceOrientation:self.interfaceOrientation];
    NSString *pageNumberDelimiter = nil;
    NSString *page = [self.dataObject valueForKey:@"page"];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *pageNumber = [formatter numberFromString:page];
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSNumber *downloadedPages = delegate.downloadedPages;
    if (downloadedPages && pageNumber.integerValue >= downloadedPages.integerValue && downloadedPages.integerValue != 16) {
        self.nextPageButton.enabled = NO;
        self.downloadingProgress.hidden = NO;
        [self.downloadingProgress startAnimating];
    } else {
        self.downloadingProgress.hidden = YES;
        [self.downloadingProgress stopAnimating];
        self.nextPageButton.enabled = YES;
    }
    if (!self.currentSelectedFlagTag) {
        NSArray* preferredLangs = [NSLocale preferredLanguages];
        if (preferredLangs.count > 0) {
            NSString *language = [preferredLangs objectAtIndex:0];

            if ([language isEqualToString:@"ru"]) { 
                self.currentSelectedFlagTag = [[NSNumber alloc] initWithInt:5];
                pageNumberDelimiter = @"из";
            }
            if ([language isEqualToString:@"zh-Hans"] || [language isEqualToString:@"zh-Hant"]) { 
                self.currentSelectedFlagTag = [[NSNumber alloc] initWithInt:1];
                pageNumberDelimiter = @"从";

            }
            if ([language isEqualToString:@"en"] || [language isEqualToString:@"en-GB"] ) { 
                self.currentSelectedFlagTag = [[NSNumber alloc] initWithInt:2];
                pageNumberDelimiter = @"from";

            }
            if ([language isEqualToString:@"es"]) {
                self.currentSelectedFlagTag = [[NSNumber alloc] initWithInt:3];
                pageNumberDelimiter = @"de";

            }
            if ([language isEqualToString:@"ar"]) { 
                self.currentSelectedFlagTag = [[NSNumber alloc] initWithInt:4];
                pageNumberDelimiter = @"من";

            }
            if ([language isEqualToString:@"de"]) {
                self.currentSelectedFlagTag = [[NSNumber alloc] initWithInt:6];
                pageNumberDelimiter = @"von";

            }
            [[NSUserDefaults standardUserDefaults] setValue:self.currentSelectedFlagTag forKey:@"currentSelectedFlagTag"];
            [[NSUserDefaults standardUserDefaults] synchronize];

        }
        [self startAnimationForFlagsForSelectedTag:self.currentSelectedFlagTag.unsignedIntegerValue forFirstStart:NO];
    }
    else [self startAnimationForFlagsForSelectedTag:self.currentSelectedFlagTag.unsignedIntegerValue forFirstStart:NO];


}
- (void)viewWillDisappear:(BOOL)animated
{
    [self.theAudio stop];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    [self prepareAllImagesForInterfaceOrientation:interfaceOrientation];

//    NSDictionary *dataForPage = self.dataObject;
//    UIImage *imageLandscape = nil;
//    UIImage *imagePortrait = nil;
//    //NSLog(@"data for page:%@",dataForPage);
//    UIImage *imageLandscapeBackground = nil;
//    UIImage *imagePortraitBackground = nil;
//    if (![[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ) {
//        imageLandscape = [dataForPage valueForKey:@"image_IPhoneLandscape"];
//        imagePortrait = [dataForPage valueForKey:@"image_IPhonePortrait"];
//        
//        imageLandscapeBackground = [UIImage imageNamed:@"page00GIPhone.png"];
//        imagePortraitBackground = [UIImage imageNamed:@"page00VIPhone.png"];
//        
//        
//    } else {
//        imageLandscape = [dataForPage valueForKey:@"image_IPadLandscape"];
//        imagePortrait = [dataForPage valueForKey:@"image_IPadPortrait"];
//        imageLandscapeBackground = [UIImage imageNamed:@"page00GIPad.png"];
//        imagePortraitBackground = [UIImage imageNamed:@"page00VIPad.png"];
//    }
//    
//    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) { 
//        [self.image setImage:imageLandscape];
//        [self.imageBackground setImage:imageLandscapeBackground];
//
//        if (![[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ) {
//            //iPhone
//            self.playStop.frame = CGRectMake(385, 17, self.playStop.frame.size.width, self.playStop.frame.size.height);
//            self.playbackProgress.frame = CGRectMake(385, 0, self.playbackProgress.frame.size.width, self.playbackProgress.frame.size.height);
//            self.buttonsView.frame = CGRectMake(320, 130, self.buttonsView.frame.size.width, self.buttonsView.frame.size.height);
//            self.text.frame = CGRectMake(7, 203, 305, 70);
//            self.finalTextInsideBox.frame = CGRectMake(7, 203, 303, 70);
//            self.pageNumber.frame = CGRectMake(7, - 20, self.pageNumber.frame.size.width, self.pageNumber.frame.size.height);
//        } else {
//            // iPad
//            self.playStop.frame = CGRectMake(888, 349, self.playStop.frame.size.width, self.playStop.frame.size.height);
//            self.playbackProgress.frame = CGRectMake(888, 429, self.playbackProgress.frame.size.width, self.playbackProgress.frame.size.height);
//            self.buttonsView.frame = CGRectMake(763, 466, self.buttonsView.frame.size.width, self.buttonsView.frame.size.height);
//            self.text.frame = CGRectMake(20, 552, 735, 155);
//            self.finalTextInsideBox.frame = CGRectMake(35, 565, 703, 126);
//            self.pageNumber.frame = CGRectMake(20, - 20, self.pageNumber.frame.size.width, self.pageNumber.frame.size.height);
//
//        }
//    }
//    else { 
//        [self.image setImage:imagePortrait];
//        [self.imageBackground setImage:imagePortraitBackground];
//
//        if (![[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ) {
//            //iPhone
//            
//            self.playStop.frame = CGRectMake(236, 178, self.playStop.frame.size.width, self.playStop.frame.size.height);
//            self.playbackProgress.frame = CGRectMake(236, 253, self.playbackProgress.frame.size.width, self.playbackProgress.frame.size.height);
//            self.buttonsView.frame = CGRectMake(163, 270, self.buttonsView.frame.size.width, self.buttonsView.frame.size.height);
//            self.text.frame = CGRectMake(6, 270, 163, 152);
//            self.finalTextInsideBox.frame = CGRectMake(13, 276, 156, 146);
//            self.pageNumber.frame = CGRectMake(111, 420, self.pageNumber.frame.size.width, self.pageNumber.frame.size.height);
//
//        } else {
//            //iPad
//            self.playStop.frame = CGRectMake(619, 543, self.playStop.frame.size.width, self.playStop.frame.size.height);
//            self.playbackProgress.frame = CGRectMake(619, 623, self.playbackProgress.frame.size.width, self.playbackProgress.frame.size.height);
//            self.buttonsView.frame = CGRectMake(507, 666, self.buttonsView.frame.size.width, self.buttonsView.frame.size.height);
//            self.text.frame = CGRectMake(20, 666, 479, 241);
//            self.finalTextInsideBox.frame = CGRectMake(45, 679, 443, 228);
//            self.pageNumber.frame = CGRectMake(280, 924, self.pageNumber.frame.size.width, self.pageNumber.frame.size.height);
//
//        }
//    }

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (BOOL)shouldAutorotate {
    UIInterfaceOrientation orientation = [[UIDevice currentDevice] orientation];
    return [self shouldAutorotateToInterfaceOrientation:orientation];
}
- (IBAction)previousPageStart:(id)sender {
    NSArray *viewControllers = nil;
    
    NSUInteger indexOfCurrentViewController = [self.modelController indexOfViewController:self];
    if (indexOfCurrentViewController == 0) {
        // do nothing for previous from zero
//        UIViewController *nextViewController = [self.modelController pageViewController:self.modelController.pageViewController viewControllerBeforeViewController:self];
//        viewControllers = [NSArray arrayWithObjects:self, nextViewController, nil];
    } else {
        UIViewController *previousViewController = [self.modelController pageViewController:self.modelController.pageViewController viewControllerBeforeViewController:self];
        viewControllers = [NSArray arrayWithObjects:previousViewController, nil];
        [self.modelController.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:NULL];

    }

}

- (IBAction)nextPageStart:(id)sender {
    
    NSUInteger retreivedIndex = [self.modelController indexOfViewController:self];
    NSArray *viewControllers = nil;
//    
//    NSUInteger indexOfCurrentViewController = [self.modelController indexOfViewController:self];
//    if (indexOfCurrentViewController == 0 || indexOfCurrentViewController > 0 || indexOfCurrentViewController < 17) {
//        NSLog(@"NEXT PAGE current controlle:%u",indexOfCurrentViewController);
//        
//        UIViewController *nextViewController = [self.modelController pageViewController:self.modelController.pageViewController viewControllerAfterViewController:self];
//        viewControllers = [NSArray arrayWithObjects:self, nextViewController, nil];
//        [self.modelController.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
//        
//    } else {
//        NSLog(@"DO NOTHING TO NEXT");
//        //        UIViewController *previousViewController = [self.modelController pageViewController:self.modelController.pageViewController viewControllerBeforeViewController:self];
//        //        viewControllers = [NSArray arrayWithObjects:previousViewController, self, nil];
//    }
    
    if (retreivedIndex < 17){
        
        //get the page to go to
        UIViewController *previousViewController = [self.modelController pageViewController:self.modelController.pageViewController viewControllerAfterViewController:self];
        if (previousViewController) {
            viewControllers = [NSArray arrayWithObjects:previousViewController, nil];
            [self.modelController.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
        }
        //put it(or them if in landscape view) in an array
//        NSArray *theViewControllers = nil;    
//        theViewControllers = [NSArray arrayWithObjects:targetPageViewController, nil];
        
        //add page view
        
    }
}

- (IBAction)flagStart:(id)sender {
    
    //NSInteger tag = [sender tag];
    
    
    //NSUInteger index = [self.allFlagsButtons indexOfObject:sender];

    
//    if (index == 0) {
//        // do nothing, it's a selected current choice.
//        
//    } else {
        
    [UIView animateWithDuration:0.5 animations:^{
        UIButton *mainButton = [self.allFlagsButtons objectAtIndex:self.currentSelectedFlagTag.unsignedIntegerValue];
        
        mainButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);        //button.transform = CGAffineTransformScale(button.transform, 1.0 / 1.2, 1.0 / 1.2);
        [[mainButton superview] sendSubviewToBack:mainButton];  
        [mainButton setUserInteractionEnabled:YES];
        
        switch (mainButton.tag) {
            case 0:
                mainButton.imageView.image = [UIImage imageNamed:@"UA.png"];
                break;
            case 1:
                mainButton.imageView.image = [UIImage imageNamed:@"CN.png"];
                break;
            case 2:
                mainButton.imageView.image = [UIImage imageNamed:@"GB.png"];
                break;
            case 3:
                mainButton.imageView.image = [UIImage imageNamed:@"SP.png"];
                break;
            case 4:
                mainButton.imageView.image = [UIImage imageNamed:@"AE.png"];
                break;
            case 5:
                mainButton.imageView.image = [UIImage imageNamed:@"RUS.png"];
                break;
            case 6:
                mainButton.imageView.image = [UIImage imageNamed:@"DE.png"];
                break;
                
            default:
                break;
        }
        
    } completion:^(BOOL finished) {
        //NSLog(@"buttonFinalSizeAfterClick:%@",NSStringFromCGSize(button.frame.size));
        [self startAnimationForFlagsForSelectedTag:[sender tag] forFirstStart:NO]; 
    }];
    
    //}
}

CGFloat radiansForHour(CGFloat hour)
{
    return 2 * M_PI * (hour - 3) / 12;
}
static inline double radians (double degrees) { return degrees * M_PI/180; }

-(void) startAnimationForFlagsForSelectedTag:(NSInteger)selectedTag forFirstStart:(BOOL)isFirstStart;
{
    self.currentSelectedFlagTag = [[NSNumber alloc] initWithInteger:selectedTag];
    [[NSUserDefaults standardUserDefaults] setValue:self.currentSelectedFlagTag forKey:@"currentSelectedFlagTag"];
    [[NSUserDefaults standardUserDefaults] synchronize];
  
    // change localized page number
    BOOL isReverseShow = NO;
    
    NSString *pageNumberDelimiter = nil;
    if (self.currentSelectedFlagTag.unsignedIntegerValue == 0 || self.currentSelectedFlagTag.unsignedIntegerValue == 5) { 
        pageNumberDelimiter = @"из";
    }
    
    if ( self.currentSelectedFlagTag.unsignedIntegerValue == 2) { 
        pageNumberDelimiter = @"from";
    }

    if (self.currentSelectedFlagTag.unsignedIntegerValue == 1) { 
        pageNumberDelimiter = @" ";

    }
    if (self.currentSelectedFlagTag.unsignedIntegerValue == 3) { 
        pageNumberDelimiter = @"de";
    }
    
    if (self.currentSelectedFlagTag.unsignedIntegerValue == 4) { 
        pageNumberDelimiter = @" من";
        isReverseShow = YES;
        
    }
    if (self.currentSelectedFlagTag.unsignedIntegerValue == 6) { 
        pageNumberDelimiter = @"von";
    }
    
    NSString *page = [self.dataObject valueForKey:@"page"];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *pageNumber = [formatter numberFromString:page];
    formatter.locale = [NSLocale currentLocale];
    
//    if (isReverseShow == YES) self.pageNumber.text = [NSString stringWithFormat:@"%@ %@ %@",[formatter stringFromNumber:[NSNumber numberWithInt:16]],pageNumberDelimiter,[formatter stringFromNumber:pageNumber]];
//    else 
    self.pageNumber.text = [NSString stringWithFormat:@"%@ %@ %@",[formatter stringFromNumber:pageNumber],pageNumberDelimiter,[formatter stringFromNumber:[NSNumber numberWithInt:16]]];
    
//    NSLog(@">>>>>>>>>>>>%@",[NSString stringWithFormat:@"%@ %@ %@",[formatter stringFromNumber:[NSNumber numberWithInt:16]],pageNumberDelimiter,[formatter stringFromNumber:pageNumber]]);
    
    
    
    NSString *language = nil;
    
    switch (self.currentSelectedFlagTag.integerValue) {
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
    NSString *finalFileName = [NSString stringWithFormat:@"page%@%@",page,language];
    
    NSURL *fileToText = [[NSBundle mainBundle] URLForResource:finalFileName withExtension:@"txt"];
    NSError *error = nil;
    
    NSString *text = [NSString stringWithContentsOfURL:fileToText encoding:NSUTF8StringEncoding error:&error];
    
    if (error) NSLog(@"DATA VIEW: error encoding:%@",[error localizedDescription]);
    self.finalTextInsideBox.text = text;

    if ([language isEqualToString:@"AE"]) { 
        self.finalTextInsideBox.textAlignment = UITextAlignmentRight;
//        [self.finalTextInsideBox scrollRangeToVisible:NSMakeRange(self.finalTextInsideBox.text.length, 1)];
//            NSMutableString *reversedStr;
//            int len = [text length];
//            
//            // Auto released string
//            reversedStr = [NSMutableString stringWithCapacity:len];     
//            
//            // Probably woefully inefficient...
//            while (len > 0)
//                [reversedStr appendString:
//                 [NSString stringWithFormat:@"%C", [text characterAtIndex:--len]]];   
//        self.finalTextInsideBox.text = reversedStr;

    }
    else { 
        self.finalTextInsideBox.textAlignment = UITextAlignmentLeft;

    }
    //NSLog(@">>>>>>>>>>> selected:");

    switch (selectedTag) {
        case 0:
            NSLog(@"UA");
            break;
        case 1:
            NSLog(@"CN");
            break;
        case 2:
            NSLog(@"GB");
            break;
        case 3:
            NSLog(@"SP");
            break;
        case 4:
            NSLog(@"AE");
            break;
        case 5:
            NSLog(@"RUS");
            break;
        case 6:
            NSLog(@"DE");
            break;
            
        default:
            break;
    }

    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.delegate = self;
    
    //CGPathMoveToPoint(curvedPath, NULL, origin.x, origin.y);
    CGFloat x = self.buttonsView.frame.size.width / 2;
    CGFloat y = self.buttonsView.frame.size.width / 2;
    //NSLog(@"x:%f y:%f",x,y);
    //NSLog(@"buttons view frame:%@",NSStringFromCGRect(self.buttonsView.frame));
    
    CGFloat radius = self.buttonsView.frame.size.width / 2 - self.flagAE.frame.size.width / 2;
    //NSLog(@">>>>>>>>>>> positions in array:");
    [self.allFlagsButtons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        //UIButton *animatedButton = obj;
        CGMutablePathRef curvedPath1 = CGPathCreateMutable();
        
        CGFloat startPosition = 0;
        CGFloat stopPosition = 0;
        
        if (isFirstStart) startPosition = 12,stopPosition = 1.71428571 * idx;
        else startPosition = 1.71428571 * idx,stopPosition = (7 - selectedTag + idx) * 1.71428571;
        
        CGPathAddArc(curvedPath1, NULL, x , y , radius, radiansForHour(startPosition) , radiansForHour(stopPosition), NO);

        switch ([obj tag]) {
            case 0:
                //NSLog(@"UA - startPosition:%f stopPosition:%f",startPosition,stopPosition);
                //animatedButton.imageView.image = [UIImage imageNamed:@"UA.png"];
                break;
            case 1:
                //NSLog(@"CN - startPosition:%f stopPosition:%f",startPosition,stopPosition);
                //animatedButton.imageView.image = [UIImage imageNamed:@"CN.png"];
                break;
            case 2:
                //NSLog(@"GB - startPosition:%f stopPosition:%f",startPosition,stopPosition);
                //animatedButton.imageView.image = [UIImage imageNamed:@"GB.png"];
                break;
            case 3:
                //NSLog(@"SP - startPosition:%f stopPosition:%f",startPosition,stopPosition);
                //animatedButton.imageView.image = [UIImage imageNamed:@"SP.png"];
                break;
            case 4:
                //NSLog(@"AE - startPosition:%f stopPosition:%f",startPosition,stopPosition);
                //animatedButton.imageView.image = [UIImage imageNamed:@"AE.png"];
                break;
            case 5:
                //NSLog(@"RUS - startPosition:%f stopPosition:%f",startPosition,stopPosition);        
                //animatedButton.imageView.image = [UIImage imageNamed:@"RUS.png"];
                break;
            case 6:
                //NSLog(@"DE - startPosition:%f stopPosition:%f",startPosition,stopPosition);
                //animatedButton.imageView.image = [UIImage imageNamed:@"DE.png"];
                break;
                
            default:
                break;
        }

        
        pathAnimation.path = curvedPath1;
        pathAnimation.duration = 1;
        //NSLog(@"firstPoint:%@",NSStringFromCGPoint(self.flag1.frame.origin));
        if ([obj tag] == selectedTag) { 
            [[obj layer] addAnimation:pathAnimation forKey:@"finalPoint"]; 
            [obj setUserInteractionEnabled:NO];
        }
        else [[obj layer] addAnimation:pathAnimation forKey:@"moving"];  
 
    }];
//    UIButton *selectedButton = [self.allFlagsButtons objectAtIndex:selectedTag];
//    [self.allFlagsButtons removeObject:selectedButton];
//    [self.allFlagsButtons insertObject:selectedButton atIndex:0];

    
}


- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
    //                                                                          0           1       2           3           4                      
    //     self.allFlagsImages = [[NSMutableArray alloc] initWithObjects:self.flagUA,self.flagCN,self.flagGB,self.flagSP,self.flagAE,self.flagRUS,self.flagDE, nil];
    //      5           6
    CAKeyframeAnimation *pathAnimation = (CAKeyframeAnimation *)theAnimation;
    CGPathRef path = pathAnimation.path;
    CGPoint finalPoint = CGPathGetCurrentPoint(path);
    
    [self.allFlagsButtons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (theAnimation == [[obj layer] animationForKey:@"moving"]) {
            [obj setFrame:CGRectMake(finalPoint.x - [obj frame].size.width / 2, finalPoint.y - [obj frame].size.width / 2, [obj frame].size.width, [obj frame].size.height)];

        }

        if (theAnimation == [[obj layer] animationForKey:@"finalPoint"]) {
            [obj setFrame:CGRectMake(finalPoint.x - [obj frame].size.width / 2, finalPoint.y - [obj frame].size.width / 2, [obj frame].size.width, [obj frame].size.height)];
            [[obj superview] bringSubviewToFront:obj];  
            UIButton *button = obj;

            [UIView animateWithDuration:0.5 animations:^{
                button.transform = CGAffineTransformScale(button.transform, 1.2, 1.2);
                switch (button.tag) {
                    case 0:
                        button.imageView.image = [UIImage imageNamed:@"A_UA.png"];
                        break;
                    case 1:
                        button.imageView.image = [UIImage imageNamed:@"A_CN.png"];
                        break;
                    case 2:
                        button.imageView.image = [UIImage imageNamed:@"A_GB.png"];
                        break;
                    case 3:
                        button.imageView.image = [UIImage imageNamed:@"A_SP.png"];
                        break;
                    case 4:
                        button.imageView.image = [UIImage imageNamed:@"A_AE.png"];
                        break;
                    case 5:
                        button.imageView.image = [UIImage imageNamed:@"A_RUS.png"];
                        break;
                    case 6:
                        button.imageView.image = [UIImage imageNamed:@"A_DE.png"];
                        break;
                        
                    default:
                        break;
                }

            } completion:^(BOOL finished) {
                //NSLog(@"buttonFinalSizeBeforeClick:%@",NSStringFromCGSize(button.frame.size));

            }];

        }


    }];
    
}
-(void)updateProgress;
{
    dispatch_async(dispatch_get_main_queue(), ^(void) { 

    self.playbackProgress.progress = self.theAudio.currentTime / self.theAudio.duration;
    });
}


- (IBAction)playStart:(id)sender {
    
    self.playbackProgress.progress = 0;
    
    [self.playStop removeTarget:self action:@selector(playStart:) forControlEvents:UIControlEventTouchUpInside];
    [self.playStop addTarget:self action:@selector(playStop:) forControlEvents:UIControlEventTouchUpInside];
//    [UIView animateWithDuration:3 animations:^{
//        //self.playStop.alpha = 0.5;
//    } completion:^(BOOL finished) {
        //self.playStop.alpha = 1.0;
    [UIView beginAnimations:@"flipbutton" context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.playStop cache:YES];
    
    [self.playStop setImage:[UIImage imageNamed:@"stop.png"] forState:UIControlStateNormal];
    
    [UIView commitAnimations];

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^(void) {
            NSString *page = [self.dataObject valueForKey:@"page"];
            
            NSString *language = nil;
            
            switch (self.currentSelectedFlagTag.integerValue) {
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
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            NSNumber *pageNumber = [formatter numberFromString:page];
            NSURL *fileToPlay = nil;
            if (pageNumber.intValue < 3) {
                NSString *finalFileName = [NSString stringWithFormat:@"page%@audio%@",page,language];
                fileToPlay = [[NSBundle mainBundle] URLForResource:finalFileName withExtension:@"caf"];
            } else {
                NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                NSString *documentsDirectory = [paths objectAtIndex:0];
                NSString *finalFileName = [NSString stringWithFormat:@"%@/%@/page%@audio%@.caf",documentsDirectory,language,page,language];
                fileToPlay = [NSURL fileURLWithPath:finalFileName];
            }
            //NSData *dataVoice = [NSData dataWithContentsOfURL:fileToPlay];
            NSError *error = nil;
            self.theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:fileToPlay error:&error];
            self.theAudio.delegate = self;
            if (!error) {
                dispatch_async(dispatch_get_main_queue(), ^(void) {
                    self.progressTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
                    self.playbackProgress.hidden = NO;
                });
                //self.playbabkProgress.m = NO;
                [self.theAudio prepareToPlay];
                [self.theAudio play];
            }
        });
        
//    }];
}

- (IBAction)playStop:(id)sender {
    //NSLog(@"playStop");
    //NSLog(@"data for page:%@",self.dataObject);
    [self.playStop removeTarget:self action:@selector(playStop:) forControlEvents:UIControlEventTouchUpInside];
    [self.playStop addTarget:self action:@selector(playStart:) forControlEvents:UIControlEventTouchUpInside];
    
    //self.playStop.imageView.image = [UIImage imageNamed:@"play.png"];
    [UIView beginAnimations:@"flipbutton" context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.playStop cache:YES];
    
    [self.playStop setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    self.playbackProgress.hidden = YES;

    [UIView commitAnimations];

    [self.theAudio stop];
    [self.progressTimer invalidate];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag;
{
    [self.progressTimer invalidate];

    [self.playStop removeTarget:self action:@selector(playStop:) forControlEvents:UIControlEventTouchUpInside];
    [self.playStop addTarget:self action:@selector(playStart:) forControlEvents:UIControlEventTouchUpInside];
    
    [UIView beginAnimations:@"flipbutton" context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.playStop cache:YES];
    self.playbackProgress.hidden = YES;

    [self.playStop setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    
    [UIView commitAnimations];

}
- (IBAction)animalVoiceChange:(id)sender {
    
}

@end
