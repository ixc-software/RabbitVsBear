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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.dataLabel = nil;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //self.dataLabel.text = [self.dataObject description];
    NSDictionary *dataForPage = self.dataObject;
    //NSLog(@"data for page:%@",dataForPage);
    self.pageNumber.text = [dataForPage valueForKey:@"page"];
    UIImage *imageLandscape = nil;
    UIImage *imagePortrait = nil;
    UIFont *currentFont = self.finalTextInsideBox.font;
    
    if (![[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ) {
        imageLandscape = [dataForPage valueForKey:@"imageIphoneLandscape"];
        imagePortrait = [dataForPage valueForKey:@"imageIphonePortrait"];
        self.finalTextInsideBox.font = [UIFont fontWithName:currentFont.fontName size:14.0];
        
    } else {
        imageLandscape = [dataForPage valueForKey:@"imageIPadLandscape"];
        imagePortrait = [dataForPage valueForKey:@"imageIPadPortrait"];
        self.finalTextInsideBox.font = [UIFont fontWithName:currentFont.fontName size:24.0];

    }
    //[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"currentSelectedFlagTag"];

    self.currentSelectedFlagTag = [[NSUserDefaults standardUserDefaults] valueForKey:@"currentSelectedFlagTag"];
    
    UIInterfaceOrientation currentOrientation = self.interfaceOrientation;
    if (currentOrientation == UIInterfaceOrientationLandscapeLeft || currentOrientation == UIInterfaceOrientationLandscapeRight) [self.image setImage:imageLandscape];
    else [self.image setImage:imagePortrait];
    if (!self.currentSelectedFlagTag) { 
        NSArray* preferredLangs = [NSLocale preferredLanguages];
        if (preferredLangs.count > 0) {
            NSString *language = [preferredLangs objectAtIndex:0];

            if ([language isEqualToString:@"ru"]) self.currentSelectedFlagTag = [[NSNumber alloc] initWithInt:5];
            if ([language isEqualToString:@"zh-Hans"] || [language isEqualToString:@"zh-Hant"]) self.currentSelectedFlagTag = [[NSNumber alloc] initWithInt:1];
            if ([language isEqualToString:@"en"] || [language isEqualToString:@"en-GB"] ) self.currentSelectedFlagTag = [[NSNumber alloc] initWithInt:5];
            if ([language isEqualToString:@"es"]) self.currentSelectedFlagTag = [[NSNumber alloc] initWithInt:3];
            if ([language isEqualToString:@"ar"]) self.currentSelectedFlagTag = [[NSNumber alloc] initWithInt:4];
            if ([language isEqualToString:@"de"]) self.currentSelectedFlagTag = [[NSNumber alloc] initWithInt:6];
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
    NSDictionary *dataForPage = self.dataObject;
    UIImage *imageLandscape = nil;
    UIImage *imagePortrait = nil;
    //NSLog(@"data for page:%@",dataForPage);

    if (![[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ) {
        imageLandscape = [dataForPage valueForKey:@"imageIphoneLandscape"];
        imagePortrait = [dataForPage valueForKey:@"imageIphonePortrait"];
    } else {
        imageLandscape = [dataForPage valueForKey:@"imageIPadLandscape"];
        imagePortrait = [dataForPage valueForKey:@"imageIPadPortrait"];
    }
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) { 
        [self.image setImage:imageLandscape];
        if (![[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ) {
            //iPhone
            self.playStop.frame = CGRectMake(385, 17, self.playStop.frame.size.width, self.playStop.frame.size.height);
            self.playbackProgress.frame = CGRectMake(385, 0, self.playbackProgress.frame.size.width, self.playbackProgress.frame.size.height);
            self.buttonsView.frame = CGRectMake(330, 130, self.buttonsView.frame.size.width, self.buttonsView.frame.size.height);
            self.text.frame = CGRectMake(7, 203, 295, 70);
            self.finalTextInsideBox.frame = CGRectMake(7, 203, 283, 70);
        } else {
            // iPad
            self.playStop.frame = CGRectMake(888, 349, self.playStop.frame.size.width, self.playStop.frame.size.height);
            self.playbackProgress.frame = CGRectMake(888, 429, self.playbackProgress.frame.size.width, self.playbackProgress.frame.size.height);
            self.buttonsView.frame = CGRectMake(763, 466, self.buttonsView.frame.size.width, self.buttonsView.frame.size.height);
            self.text.frame = CGRectMake(20, 552, 735, 155);
            self.finalTextInsideBox.frame = CGRectMake(35, 565, 703, 126);

        }
    }
    else { 
        [self.image setImage:imagePortrait];

        if (![[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ) {
            //iPhone
            
            self.playStop.frame = CGRectMake(228, 199, self.playStop.frame.size.width, self.playStop.frame.size.height);
            self.playbackProgress.frame = CGRectMake(228, 274, self.playbackProgress.frame.size.width, self.playbackProgress.frame.size.height);
            self.buttonsView.frame = CGRectMake(179, 301, self.buttonsView.frame.size.width, self.buttonsView.frame.size.height);
            self.text.frame = CGRectMake(6, 294, 184, 139);
            self.finalTextInsideBox.frame = CGRectMake(13, 300, 167, 126);
        } else {
            //iPad
            self.playStop.frame = CGRectMake(619, 543, self.playStop.frame.size.width, self.playStop.frame.size.height);
            self.playbackProgress.frame = CGRectMake(619, 623, self.playbackProgress.frame.size.width, self.playbackProgress.frame.size.height);
            self.buttonsView.frame = CGRectMake(489, 733, self.buttonsView.frame.size.width, self.buttonsView.frame.size.height);
            self.text.frame = CGRectMake(20, 666, 442, 298);
            self.finalTextInsideBox.frame = CGRectMake(45, 679, 404, 272);

        }
    }

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}
- (IBAction)previousPageStart:(id)sender {
    NSArray *viewControllers = nil;
    
    NSUInteger indexOfCurrentViewController = [self.modelController indexOfViewController:self];
    if (indexOfCurrentViewController == 0 || indexOfCurrentViewController % 3 == 0) {
        UIViewController *nextViewController = [self.modelController pageViewController:self.modelController.pageViewController viewControllerBeforeViewController:self];
        viewControllers = [NSArray arrayWithObjects:self, nextViewController, nil];
    } else {
        UIViewController *previousViewController = [self.modelController pageViewController:self.modelController.pageViewController viewControllerAfterViewController:self];
        viewControllers = [NSArray arrayWithObjects:previousViewController, self, nil];
    }
    [self.modelController.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:NULL];

}

- (IBAction)nextPageStart:(id)sender {
    
//    NSUInteger retreivedIndex = [self.modelController indexOfViewController:self];
//    NSArray *viewControllers = nil;
//
//    NSUInteger indexOfCurrentViewController = [self.modelController indexOfViewController:self];
//    if (indexOfCurrentViewController == 0 || indexOfCurrentViewController > 0 || indexOfCurrentViewController < 3) {
//        NSLog(@"NEXT PAGE current controlle:%u",indexOfCurrentViewController);
//
//        UIViewController *nextViewController = [self.modelController pageViewController:self.modelController.pageViewController viewControllerAfterViewController:self];
//        viewControllers = [NSArray arrayWithObjects:self, nextViewController, nil];
//        [self.modelController.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
//
//    } else {
//        NSLog(@"DO NOTHING TO NEXT");
////        UIViewController *previousViewController = [self.modelController pageViewController:self.modelController.pageViewController viewControllerBeforeViewController:self];
//        viewControllers = [NSArray arrayWithObjects:previousViewController, self, nil];
//    }

//    if (retreivedIndex < 3){
//        
//        //get the page to go to
 //       DataViewController *targetPageViewController = [self.modelController viewControllerAtIndex:(retreivedIndex + 1) storyboard:self.storyboard];
//        
//        //put it(or them if in landscape view) in an array
   //     NSArray *theViewControllers = nil;    
   //     theViewControllers = [NSArray arrayWithObjects:targetPageViewController, nil];
//        
//        //add page view
//        
  //  }
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
            NSString *finalFileName = [NSString stringWithFormat:@"page%@audio%@",page,language];

            NSURL *fileToPlay = [[NSBundle mainBundle] URLForResource:finalFileName withExtension:@"mp3"];
            self.theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:fileToPlay error:NULL];  
            self.theAudio.delegate = self; 
            dispatch_async(dispatch_get_main_queue(), ^(void) { 
                self.progressTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];

                self.playbackProgress.hidden = NO;
            });            
            //self.playbabkProgress.m = NO;

            [self.theAudio prepareToPlay];
            [self.theAudio play];
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

@end